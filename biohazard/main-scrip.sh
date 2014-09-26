#!/bin/bash
# Main script to execute all the intallation scripts
dir=${0%/*}

source $dir/post-install-procedures.sh
source $dir/install-vim.sh
source $dir/install-java.sh
source $dir/install-gradle.sh
source $dir/install-git.sh
