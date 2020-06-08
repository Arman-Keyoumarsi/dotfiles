#!/bin/bash

#NodeJs for COC plugin in VIM
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Installing essentialse
sudo apt-get install -y build-essential vim curl wget python3-dev ripgrep cmake
sudo apt-get install -y tmux
sudo apt-get install -y mosh
#Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
#Ansible
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible
#AWS CLI
sudo apt install -y awscli
#Install Kubctl
sudo apt install -y kubectl
# Installing Docker on an Ubuntu machine
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ${USER}

#  Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-update-rc

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products
sudo apt-get update
# Enable the "universe" repositories
sudo add-apt-repository universe
# Install PowerShell
sudo apt-get install -y powershell
