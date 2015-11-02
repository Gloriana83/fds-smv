#!/bin/bash


FED=
MOVIE=
RUNSCRIPT=
ssffile=
TIMEOPTION=
SSH=

while getopts 'd:fmtS:' OPTION
do
case $OPTION in
  d)
   dir="$OPTARG"
   ;;
  f)
   FED="-fed"
   ;;
  m)
   MOVIE="y"
   ;;
  S)
   SSH="$OPTARG"
   ;;
  t)
   TIMEOPTION=-time
   ;;
esac
done
shift $(($OPTIND-1))

in=$1
in=${in%*.*}

if [ "$FED" == "" ]; then
if [ "$MOVIE" == "" ]; then
  RUNSCRIPT=-runscript
  ssffile=$in.ssf
else
  MOVIE=_movies
  RUNSCRIPT="-script $in$MOVIE.ssf"
  ssffile=$in$MOVIE.ssf
fi
fi

fulldir=$BASEDIR/$dir
echo ""
echo "--- generating images for: $in.smv"

scriptfile=$scratchdir/script.$$

notfound=`$SMV -help 2>&1 | tail -1 | grep "not found" | wc -l`
if [ "$notfound" == "1" ];  then
  echo "*** Error: The program $SMV is not available. Run aborted."
  exit
fi
if ! [ -d $fulldir ]; then
  echo "*** Error: The directory $fulldir does not exist. Run aborted."
  exit
fi
if ! [ -e $fulldir/$in.smv ]; then
  echo "*** Error: The smokeview file, $fulldir/$in.smv, does not exist. Run aborted."
  exit
fi
if ! [ -e $fulldir/$ssffile ]; then
  echo "*** Error: The smokeview script file, $fulldir/$ssffile, does not exist. Run aborted."
  exit
fi

#source ~/.bashrc_fds default
cd $fulldir
echo $SSH $SMV $FED $SMVBINDIR $RUNSCRIPT $in
if [ "$SSH" == "" ]; then
$SMV $TIMEOPTION $FED $SMVBINDIR -redirect $RUNSCRIPT $in
else
$SSH \( cd $fulldir \; $SMV $TIMEOPTION $FED $SMVBINDIR -redirect $RUNSCRIPT $in \)
fi
