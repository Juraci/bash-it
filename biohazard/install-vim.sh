#!/bin/bash
# What: Vim installation
# How to: ???
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "---------- Vim installation ----------"
assertions.verify_command apt-get -y install vim
assertions.verify_command vim --version
