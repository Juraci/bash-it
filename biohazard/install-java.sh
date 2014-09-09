#!/bin/bash
# Sample script to automatically install Java 8
dir=${0%/*}
source $dir/assertions.sh

# pass any command you want to verity_command function
assertions.verify_command apt-get -y install python-software-properties
assertions.verify_command add-apt-repository -y ppa:webupd8team/java
assertions.verify_command apt-get -y update
assertions.verify_command echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo /usr/bin/debconf-set-selections
assertions.verify_command apt-get -y install oracle-java8-installer
assertions.verify_command java -version
