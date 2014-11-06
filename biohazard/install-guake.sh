#!/bin/bash
# What: Guake terminal installation
# How to: http://askubuntu.com/questions/368705/how-to-make-guake-start-by-starup
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "---------- Guake installation ----------"

assertions.verify_command apt-get -y install guake
