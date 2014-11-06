#!/bin/bash
# What: Git installation and github connection
# How to: http://git-scm.com/book/en/Getting-Started-Installing-Git
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "---------- Git installation ----------"


assertions.verify_command apt-get -y install git
assertions.verify_command git --version
