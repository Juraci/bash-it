#!/bin/bash
# What: ZSH shell installation
# How to: http://www.computersnyou.com/2111/2013/07/how-to-install-and-setup-zsh-as-default-shell-in-ubuntu/
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "---------- ZSH installation ----------"
assertions.verify_command apt-get -y install zsh
assertions.verify_command zsh --version
assertions.verify_command chsh -s /usr/bin/zsh
