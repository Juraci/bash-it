#!/bin/bash
# What: oh-my-zsh installation
# How to: https://github.com/robbyrussell/oh-my-zsh
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "[Begin] ---------- oh-my-zsh installation ----------"
logger.log_it "[requirements test]"

# oh-my-zsh requires zsh shell to be installed
assertions.verify_command zsh --version
zsh=$?

# oh-my-zsh requires git for automatic installation
assertions.verify_command git --version
git=$?


if [[ $zsh -ne 0 || $git -ne 0 ]] ; then
  logger.log_it "oh-my-zsh requirements not met, aborting..."
  exit 1
else
  logger.log_it "oh-my-zsh requirements ok"
fi

assertions.verify_command wget --no-check-certificate http://install.ohmyz.sh -O - | sh
assertions.directory_exists? ~/.oh-my-zsh

logger.log_it "[End] ---------- oh-my-zsh installation ----------"

