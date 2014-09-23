#!/bin/bash
# What: Java 8 installation
# How to: http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "---------- Java 8 installation ----------"

assertions.verify_command apt-get -y install python-software-properties
assertions.verify_command add-apt-repository -y ppa:webupd8team/java
assertions.verify_command apt-get -y update
assertions.verify_command echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo /usr/bin/debconf-set-selections
assertions.verify_command apt-get -y install oracle-java8-installer
assertions.verify_command java -version
