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
# parameters: $@ string to be appended in the log file
logger.log_it() { echo "$@" >> $logfile ; }
