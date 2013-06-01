#!/bin/bash

export SVNROOT=`pwd`/../..
export QFDS=/usr/local/bin/qfds.sh
export BASEDIR=`pwd`
export INDIR=Current_Results

# qq="-q fire80s"
qq=

# uncomment following line to stop all cases
# export STOPFDS=1

/bin/sh -c "cp $BASEDIR/FDS_Input_Files/*.fds $BASEDIR/$INDIR"

$QFDS -r $qq -d $INDIR FM_Parallel_Panel_1.fds
$QFDS -r $qq -d $INDIR FM_Parallel_Panel_2.fds 
$QFDS -r $qq -d $INDIR FM_Parallel_Panel_3.fds 
$QFDS -r $qq -d $INDIR FM_Parallel_Panel_4.fds 
$QFDS -r $qq -d $INDIR FM_Parallel_Panel_5.fds 
$QFDS -r $qq -d $INDIR FM_Parallel_Panel_6.fds 

echo FDS cases submitted
