#!/bin/bash
# Sample script
dir=${0%/*}               # gets the name of the current dir
source $dir/assertions.sh # includes the assertions

assertions.verify_command apt-get -y install vim
assertions.verify_command vim --version
