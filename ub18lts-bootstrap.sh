#!/bin/bash

sudo apt-get update

# Installing essentialse
sudo apt-get install -y build-essential vim curl wget python3-dev ripgrep cmake tree zip
sudo apt-get install -y tmux
sudo apt-get install -y mosh

#NodeJs for COC plugin in VIM
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

#  Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-update-rc

#Ansible
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install -y ansible

#Install Terraform and Packer
sudo wget https://releases.hashicorp.com/terraform/0.12.26/terraform_0.12.26_linux_amd64.zip -P /opt/
sudo unzip /opt/terraform*.zip -d /opt/
sudo ln -fs /opt/terraform /usr/bin/terraform

sudo wget https://releases.hashicorp.com/packer/1.6.0/packer_1.6.0_linux_amd64.zip -P /opt/
sudo unzip /opt/packer*.zip -d /opt/
sudo ln -fs /opt/packer /usr/bin/packer

#Install Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
#AWS CLI
sudo apt install -y awscli
#Install Kubctl
sudo apt install -y kubectl

# Installing Docker on an Ubuntu machine
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker ${USER}
sudo apt install docker-compose

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
