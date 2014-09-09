#!/bin/bash
# Sample script
dir=${0%/*}               # 1. get the name of the current dir
source $dir/assertions.sh # 2. include the assertions

# pass any command you want to verity_command function
assertions.verify_command apt-get -y update
assertions.verify_command apt-get -y upgrade
assertions.verify_command apt-get -y install vim

# Do a tail -f bash-it/logs/log.txt to follow the results
