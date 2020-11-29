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

#Ansible
sudo apt install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

#Install Terraform and Packer
sudo wget -O "/opt/terraform_latest_linux_amd64.zip" https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
sudo unzip -o /opt/terraform*.zip -d /opt/
sudo ln -fs /opt/terraform /usr/bin/terraform

sudo wget -O "/opt/packer_latest_linux_amd64.zip" https://releases.hashicorp.com/packer/1.6.5/packer_1.6.5_linux_amd64.zip
sudo unzip -o /opt/packer*.zip -d /opt/
sudo ln -fs /opt/packer /usr/bin/packer

sudo wget -O "/opt/sentinel_latest_linux_amd64.zip" https://releases.hashicorp.com/sentinel/0.15.6/sentinel_0.15.6_linux_amd64.zip
sudo unzip -o /opt/sentinel*.zip -d /opt/
sudo ln -fs /opt/sentinel /usr/bin/sentinel

#Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
#AWS CLI
sudo apt install -y awscli
#Install Kubctl
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Download the Microsoft repository GPG keys
sudo wget -O "/opt/packages-microsoft-prod.deb" https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i /opt/packages-microsoft-prod.deb
# Update the list of products
sudo apt-get update
# Enable the "universe" repositories
sudo add-apt-repository universe
# Install PowerShell
sudo apt-get install -y powershell

# This Should be last
# Installing Docker on an Ubuntu machine
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ${USER}
sudo apt install -y docker-compose
# for WSL use sudo service docker start

