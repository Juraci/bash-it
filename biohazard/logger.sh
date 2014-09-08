#!/bin/bash
dir=${0%/*}
logsdir="$dir/../logs"
logfile="$dir/../logs/log.txt"

if [ ! -d $logsdir ] ; then
  mkdir $logsdir
fi

if [ ! -f $logfile ] ; then
  touch $logfile
fi

# Description: appends the message passed as argument in the log file
# parameters: $1 string to be appended in the log file
log_it() { echo $1 >> $logfile ; }
