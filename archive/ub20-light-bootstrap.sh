#!/bin/bash

#Removing tiny vim
sudo apt remove --assume-yes vim-tiny
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt-get update

# Installing essentialse
sudo apt-get install -y keychain
sudo apt-get install -y build-essential
sudo apt-get install -y vim 
sudo apt-get install -y curl 
sudo apt-get install -y wget 
sudo apt-get install -y python3-dev 
sudo apt-get install -y ripgrep 
sudo apt-get install -y tree 
sudo apt-get install -y zip
sudo apt-get install -y tmux
sudo apt-get install -y mosh

#NodeJs for COC plugin in VIM
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

#  Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-update-rc
