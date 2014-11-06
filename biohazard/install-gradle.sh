#!/bin/bash
# What: Gradle installation
# How to: http://askubuntu.com/questions/328178/gradle-in-ubuntu
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "---------- Gradle installation ----------"

logger.log_it "[requirements test]"

assertions.verify_command java -version
java=$?

assertions.verify_command "dpkg --list | grep '(JDK) [6-8]'"
jdk_version=$?

if [[ $java -ne 0 || $jdk_version -ne 0 ]]; then
  logger.log_it "requirements not met, aborting..."
  exit 1
fi

assertions.verify_command add-apt-repository -y ppa:cwchien/gradle
assertions.verify_command apt-get -y update
assertions.verify_command apt-get -y install gradle
assertions.verify_command gradle --version
