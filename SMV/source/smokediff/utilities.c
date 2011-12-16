// $Date$ 
// $Revision$
// $Author$

#include "options.h"
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "svdiff.h"
#include "svn_revision.h"
#include "MALLOC.h"
#include "datadefs.h"

// svn revision character string
char utilities_revision[]="$Revision$";

/* ------------------ mesh_match ------------------------ */

int mesh_match(mesh *mesh1, mesh *mesh2){
  int ibar, jbar, kbar;

  if(mesh1->ibar!=mesh2->ibar)return 0;
  if(mesh1->jbar!=mesh2->jbar)return 0;
  if(mesh1->kbar!=mesh2->kbar)return 0;
  ibar=mesh1->ibar;
  jbar=mesh1->jbar;
  kbar=mesh1->kbar;
  if(fabs(mesh1->xplt[0]-mesh2->xplt[0])>mesh1->dx)return 0;
  if(fabs(mesh1->yplt[0]-mesh2->yplt[0])>mesh1->dy)return 0;
  if(fabs(mesh1->zplt[0]-mesh2->zplt[0])>mesh1->dz)return 0;
  if(fabs(mesh1->xplt[ibar]-mesh2->xplt[ibar])>mesh1->dx)return 0;
  if(fabs(mesh1->yplt[jbar]-mesh2->yplt[jbar])>mesh1->dy)return 0;
  if(fabs(mesh1->zplt[kbar]-mesh2->zplt[kbar])>mesh1->dz)return 0;
  return 1;
}

/* ------------------ readlabels ------------------------ */

int readlabels(flowlabels *flowlabel, FILE *stream){
  char buffer2[255],*buffer;
  unsigned int len;

  flowlabel->longlabel=NULL;
  flowlabel->shortlabel=NULL;
  flowlabel->unit=NULL;

  if(fgets(buffer2,255,stream)==NULL)return 2;
  trim(buffer2);
  buffer=trim_front(buffer2);
  len=strlen(buffer);
  if(NewMemory((void **)&flowlabel->longlabel,(unsigned int)(len+1))==0)return 2;
  STRCPY(flowlabel->longlabel,buffer);


  if(fgets(buffer2,255,stream)==NULL)return 2;
  trim(buffer2);
  buffer=trim_front(buffer2);
  len=strlen(buffer);
  if(NewMemory((void **)&flowlabel->shortlabel,(unsigned int)(len+1))==0)return 2;
  STRCPY(flowlabel->shortlabel,buffer);

  if(fgets(buffer2,255,stream)==NULL)return 2;
  trim(buffer2);
  buffer=trim_front(buffer2);
  len=strlen(buffer);
  if(NewMemory((void *)&flowlabel->unit,(unsigned int)(len+1))==0)return 2;
  STRCPY(flowlabel->unit,buffer);
  return 0;
}

  /* ------------------ getfileinfo ------------------------ */

int getfileinfo(char *filename, char *source_dir, FILE_SIZE *filesize){
  STRUCTSTAT statbuffer;
  int statfile;
  char buffer[1024];

  if(source_dir==NULL){
    strcpy(buffer,filename);
  }
  else{
    strcpy(buffer,source_dir);
    strcat(buffer,filename);
  }
  if(filesize!=NULL)*filesize=0;
  statfile=STAT(buffer,&statbuffer);
  if(statfile!=0)return statfile;
  if(filesize!=NULL)*filesize=statbuffer.st_size;
  return statfile;
}

/* ------------------ version ------------------------ */

void version(void){
    char smv_version[100];
    int svn_num;

    getSMDiffversion(smv_version);  // get Smokeview version (ie 5.x.z)
    svn_num=getmaxrevision();    // get svn revision number
    printf("\n");
    printf("Smokediff\n\n");
    printf("Version: %s\n",smv_version);
    printf("SVN Revision Number: %i\n",svn_num);
    printf("Compile Date: %s\n",__DATE__);
#ifdef X64
    printf("Platform: WIN64\n");
#endif
#ifdef WIN32
#ifndef X64
    printf("Platform: WIN32\n");
#endif
#endif
#ifndef pp_OSX64
#ifdef pp_OSX
    printf("Platform: OSX\n");
#endif
#endif
#ifdef pp_OSX64
    printf("Platform: OSX64\n");
#endif
#ifndef pp_LINUX64
#ifdef pp_LINUX
    printf("Platform: LINUX\n");
#endif
#endif
#ifdef pp_LINUX64
    printf("Platform: LINUX64\n");
#endif


}

/* ------------------ getmaxrev ------------------------ */

#define MAXREV(cval) max_revision=MAX(getrevision(cval),max_revision)
int getmaxrevision(void){
  int max_revision=0;

  MAXREV(main_revision);
  MAXREV(utilities_revision);
  MAXREV(readsmv_revision);
  MAXREV(dmalloc_revision);
  MAXREV(assert_revision);
  MAXREV(IOdslice_revision);
  MAXREV(IOdboundary_revision);
  MAXREV(IOdplot_revision);
  MAXREV(histogram_revision);
  return max_revision;
}

/* ------------------ getSMVversion ------------------------ */

void getSMDiffversion(char *SMDiffversion){
  strcpy(SMDiffversion,SMDiffVERSION);
}

/* ------------------ getrevision ------------------------ */

int getrevision(char *svn){
  char svn_string[256];
  char *svn_ptr;
  int return_val;

  svn_ptr=svn_string;
  svn=strchr(svn,':');
  if(svn==NULL||strlen(svn)<=4)return 0;
  
  svn++;
  strcpy(svn_ptr,svn);
  svn_ptr=trim_front(svn_ptr);
  svn_ptr[strlen(svn_ptr)-1]=0;
  trim(svn_ptr);
  sscanf(svn_ptr,"%i",&return_val);
  return return_val;
}

/* ------------------ fullfile ------------------------ */

void fullfile(char *fileout, char *dir, char *file){
  char *file2;

  trim(file);
  file2=trim_front(file);
  strcpy(fileout,"");
  if(dir!=NULL)strcat(fileout,dir);
  strcat(fileout,file2);
}

/* ------------------ make_fileout ------------------------ */

void make_outfile(char *outfile, char *destdir, char *file1, char *ext){
  char filecopy[1024], *file1_noext;

  trim(file1);
  strcpy(filecopy,trim_front(file1));
  file1_noext=strstr(filecopy,ext);
  strcpy(outfile,"");
  if(file1_noext==NULL)return;
  file1_noext[0]='\0';
  if(destdir!=NULL){
    strcpy(outfile,destdir);
  }
  strcat(outfile,filecopy);
  strcat(outfile,"_diff");
  strcat(outfile,ext);
}

/* ------------------ similar_grid ------------------------ */

int similar_grid(mesh *mesh1, mesh *mesh2, int *factor){

  factor[0]=1;
  factor[1]=1;
  factor[2]=1;
  
  if(fabs( mesh1->xbar0-mesh2->xbar0)>mesh1->dx/2.0)return 0;
  if(fabs( mesh1->xbar- mesh2->xbar )>mesh1->dx/2.0)return 0;
  if(fabs( mesh1->ybar0-mesh2->ybar0)>mesh1->dy/2.0)return 0;
  if(fabs( mesh1->ybar- mesh2->ybar )>mesh1->dy/2.0)return 0;
  if(fabs( mesh1->zbar0-mesh2->zbar0)>mesh1->dz/2.0)return 0;
  if(fabs( mesh1->zbar- mesh2->zbar )>mesh1->dz/2.0)return 0;

  factor[0] = mesh2->ibar/mesh1->ibar;
  if(mesh1->ibar*factor[0]!=mesh2->ibar)return 0;

  factor[1] = mesh2->jbar/mesh1->jbar;
  if(mesh1->jbar*factor[1]!=mesh2->jbar)return 0;

  factor[2] = mesh2->kbar/mesh1->kbar;
  if(mesh1->kbar*factor[2]!=mesh2->kbar)return 0;

  return 1;
}

/* ------------------ exact_grid ------------------------ */

int exact_grid(mesh *mesh1, mesh *mesh2, int *factor){
  float eps;

  factor[0]=1;
  factor[1]=1;
  factor[2]=1;
  eps = mesh1->dx/1000.0;
  if(fabs(mesh1->dx-mesh2->dx)>eps)return 0;
  eps = mesh1->dy/1000.0;
  if(fabs(mesh1->dy-mesh2->dy)>eps)return 0;
  eps = mesh1->dz/1000.0;
  if(fabs(mesh1->dz-mesh2->dz)>eps)return 0;
  return 1;
}
