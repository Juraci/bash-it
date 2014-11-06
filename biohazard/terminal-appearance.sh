#!/bin/bash
# Main script to execute all the intallation scripts
dir=${0%/*}

source $dir/install-guake.sh
source $dir/install-zsh.sh
source $dir/install-oh-my-zsh.sh
source $dir/oh-my-zsh-configuration.sh
