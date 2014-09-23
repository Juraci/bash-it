#!/bin/bash
# What: Git installation and github connection
# How to: http://git-scm.com/book/en/Getting-Started-Installing-Git
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "---------- Git installation ----------"

ssh_dir="~/.ssh"
rsa_public_file="$dir/../resources/id_rsa.pub"
rsa_file="$dir/../resources/id_rsa"
gitconfig_file="$dir/../resources/.gitconfig"

assertions.verify_command apt-get -y install git
assertions.verify_command git --version

assertions.directory_exists? $ssh_dir
if [ $? -ne 0 ]; then
  assertions.verify_command mkdir $ssh_dir
  assertions.verify_command chmod 777 $ssh_dir
fi

# your id_rsa.pub file
assertions.file_exists? $rsa_public_file
public_file=$?

# your id_rsa file
assertions.file_exists? $rsa_file
private_file=$?

# your .gitconfig file
assertions.file_exists? $gitconfig_file
config_file=$?

if [[ $public_file -eq 0 && $private_file -eq 0 && $config_file -eq 0 ]]; then
  assertions.verify_command mv $rsa_public_file "$ssh_dir/"
  assertions.verify_command mv $rsa_file "$ssh_dir/"
  assertions.verify_command mv -f $gitconfig_file "~/.gitconfig"
  assertions.verify_command ssh-agent -s
  # this command always fails because github doesn't provide ssh interface
  ssh -T git@github.com
fi
