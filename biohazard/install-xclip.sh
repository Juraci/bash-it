#!/bin/bash
dir=${0%/*}
source $dir/assertions.sh

# program that reads the contents of a file to the clipboard
assertions.verify_command apt-get -y install xclip
