#!/bin/bash
# Sample script to automatically install Java 8
dir=${0%/*}
source $dir/assertions.sh

# pass any command you want to verity_command function
verify_command apt-get -y install python-software-properties
verify_command add-apt-repository -y ppa:webupd8team/java
verify_command apt-get -y update
verify_command echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo /usr/bin/debconf-set-selections
verify_command apt-get -y install oracle-java8-installer
verify_command java -version
