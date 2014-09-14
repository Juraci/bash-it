#!/bin/bash
# Sample script to automatically installand setup Git
dir=${0%/*}
source $dir/assertions.sh

assertions.verify_command apt-get -y install git
assertions.verify_command git --version
assertions.verify_command git config --global user.name "Sample Name"
assertions.verify_command git config --global user.email sample@email.com

assertions.directory_exists? ~/.ssh
if [ $? -ne 0 ]; then
  assertions.verify_command mkdir ~/.ssh
  assertions.verify_command chmod 777 ~/.ssh
fi


echo "Follow this steps manually to link your git with your github account:"
echo "SSH configuration https://help.github.com/articles/generating-ssh-keys"
echo "or HTTPS configuration https://help.github.com/articles/caching-your-github-password-in-git"
