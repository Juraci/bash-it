#!/bin/bash
# What: oh-my-zsh agnoster theme configuration
# How to: https://gist.github.com/agnoster/3712874
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

fonts_dir="~/.fonts"
fontconfig_dir="~/.config/fontconfig"
fontconfig_file_dir="$fontconfig_dir/conf.d"

logger.log_it "[Begin] ---------- agnoster configuration ----------"
logger.log_it "[requirements test]"

# oh-my-zsh needs to be installed
assertions.directory_exists? ~/.oh-my-zsh
ohmyzsh=$?

# Python needs to be installed
assertions.verify_command python --version
python=$?

if [[ $ohmyzh -ne 0 || $python -ne 0 ]]; then
  logger.log_it "requirements not met, aborting..."
  exit 1
else
  logger.log_it "requirements ok"
fi


assertions.verify_command pip --version
pythonpip=$?

# Python-pip installation
if [ $pythonpip -ne 0 ]; then
  logger.log_it "python-pip not present, installing it..."
  assertions.verify_command apt-get -y install python-pip
  assertions.verify_command pip --version
  if [ $? -ne 0 ]; then
    logger.log_it "python-pip installation failure..."
    exit 1
  fi
fi

assertions.verify_command pip install --user git+git://github.com/Lokaltog/powerline
assertions.verify_command wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
assertions.verify_command wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

assertions.directory_exists? $fonts_dir

if [ $? -ne 0 ]; then
  assertions.verify_command mkdir $fonts_dir
fi

assertions.directory_exists? $fontconfig_dir

if [ $? -ne 0 ]; then
  assertions.verify_command mkdir $fontconfig_dir
fi

assertions.directory_exists? $fontconfig_file_dir

if [ $? -ne 0 ]; then
  assertions.verify_command mkdir $fontconfig_file_dir
fi

assertions.verify_command mv PowerlineSymbols.otf $fonts_dir
assertions.verify_command fc-cache -vf $fonts_dir
assertions.verify_command mv 10-powerline-symbols.conf "$fontconfig_file_dir/"
assertions.verify_command perl -pi -e 's/robbyrussell/agnoster/g' ~/.zshrc
assertions.verify_command sudo chsh -s /usr/bin/zsh

# Logout and login for changes to take effect

logger.log_it "[End] ---------- agnoster configuration ----------"
