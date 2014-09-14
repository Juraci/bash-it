#!/bin/bash
# What: oh-my-zsh agnoster theme configuration
# How to: https://gist.github.com/agnoster/3712874
# Version tested: Ubuntu 14.04 LTS
dir=${0%/*}
source $dir/assertions.sh

logger.log_it "[Begin] ---------- agnoster configuration ----------"
logger.log_it "[requirements test]"

# oh-my-zsh needs to be installed
assertions.directory_exists? ~/.oh-my-zsh
ohmyzsh=$?

# Python needs to be installed
python=$?

if [[ $ohmyzh -ne 0 || $python -ne 0 ]]; then
  logger.log_it "requirements not met, aborting..."
  exit 1
else
  logger.log_it "requirements ok"
fi

assertions.verify_command apt-get -y install python-pip
assertions.verify_command pip --version
pythonpip=$?

if [[ $pythonpip -ne 0 ]]; then
  logger.log_it "python-pip not present, aborting..."
  exit 1
fi

assertions.verify_command pip install --user git+git://github.com/Lokaltog/powerline
assertions.verify_command wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
assertions.verify_command wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

assertions.directory_exists? ~/.fonts

if [ $? -ne 0 ]; then
  assertions.verify_command mkdir ~/.fonts
fi

assertions.directory_exists? ~/.config/fontconfig

if [ $? -ne 0 ]; then
  assertions.verify_command mkdir ~/.config/fontconfig
fi

assertions.directory_exists? ~/.config/fontconfig/conf.d

if [ $? -ne 0 ]; then
  assertions.verify_command mkdir ~/.config/fontconfig/conf.d
fi

assertions.verify_command mv PowerlineSymbols.otf ~/.fonts/
assertions.verify_command fc-cache -vf ~/.fonts/
assertions.verify_command mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
assertions.verify_command perl -pi -e 's/robbyrussell/agnoster/g' ~/.zshrc
assertions.verify_command chsh -s /usr/bin/zsh

echo Logout and login for changes to take effect

logger.log_it "[End] ---------- agnoster configuration ----------"
