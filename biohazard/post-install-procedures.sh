#!/bin/bash
# Sample script
dir=${0%/*}               # gets the name of the current dir
source $dir/assertions.sh # includes the assertions

# passing commands to verity_command function
assertions.verify_command apt-get -y update
#assertions.verify_command apt-get -y upgrade
assertions.verify_command apt-get -y install curl

source $dir/install-vim.sh
source $dir/install-git.sh
