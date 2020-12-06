.PHONY: bash tmux vim git
all: .PHONY
DOTFILES := $(shell pwd)
OS = $(shell lsb_release -si)
ARCH = $(shell uname -m | sed 's/x86_//;s/i[3-6]86/32/')
VER = $(shell lsb_release -sr)

bash:
	ln -fs ${DOTFILES}/bash/alias ${HOME}/.alias
	ln -fs ${DOTFILES}/bash/alias ${HOME}/.bash_aliases
	ln -fns $(DOTFILES)/etc/ ${HOME}/etc
	ln -fs $(DOTFILES)/bash/bashrc ${HOME}/.bashrc
	ln -fs $(DOTFILES)/bash/bash_profile ${HOME}/.bash_profile
vim:
	sudo wget -O "/opt/terraform-ls_amd64.zip" https://releases.hashicorp.com/terraform-ls/0.10.0/terraform-ls_0.10.0_linux_amd64.zip 
	sudo unzip -o /opt/terraform-ls_amd64.zip -d /opt/
	sudo ln -fs /opt/terraform-ls /usr/bin/terraform-ls
	ln -fs $(DOTFILES)/vim/coc-setting.json ${HOME}/.vim/coc-settings.json
	mkdir -p ${HOME}/.vim/pack/plugins/start/
	mkdir -p ${HOME}/.vim/swap
	mkdir -p ${HOME}/.vim/backup
	mkdir -p ${HOME}/.vim/undodir
	cp -r $(DOTFILES)/vim/colors ${HOME}/.vim/
	ln -fs $(DOTFILES)/vim/vimrc ${HOME}/.vimrc
	ln -fs $(DOTFILES)/vim/dic-en.utf-8.add ${HOME}/.vim/dic-en.utf-8.add
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || true
	~/.fzf/install --all
git:
	ln -fs $(DOTFILES)/git/gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/git/gitcommit ${HOME}/.gitcommit
	ln -fs $(DOTFILES)/git/gitignore ${HOME}/.gitignore
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	ln -fs $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf	
ub20:
	#Removing tiny vim && Installing essentials
	sudo apt remove --assume-yes vim-tiny
	sudo add-apt-repository -y ppa:jonathonf/vim
	sudo apt-get update
	sudo apt-get install -y keychain build-essential curl wget python3-dev ripgrep tree zip tmux mosh vim
	sudo apt-get install ansible
	#NodeJs for COC plugin in VIM
	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
	sudo apt-get install -y nodejs
	#Install Terraform and Packer
	sudo wget -O "/opt/terraform_latest_linux_amd64.zip" https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
	sudo unzip -o /opt/terraform_latest_linux_amd64.zip -d /opt/
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
	# Installing Docker on an Ubuntu/mint machine
	echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" | sudo tee /etc/apt/sources.list.d/docker.list
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt update
	sudo apt install docker-ce docker-ce-cli containerd.io pigz
	sudo usermod -aG docker ${USER}
	sudo apt install -y docker-compose
	# for WSL use sudo service docker start
