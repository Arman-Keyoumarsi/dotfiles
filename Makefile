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
	mkdir -p ${HOME}/.vim/pack/plugins/start/
	mkdir -p ${HOME}/.vim/swap
	mkdir -p ${HOME}/.vim/backup
	mkdir -p ${HOME}/.vim/undodir
	cp -r $(DOTFILES)/vim/colors ${HOME}/.vim/
	ln -fs $(DOTFILES)/vim/vimrc ${HOME}/.vimrc
	ln -fs $(DOTFILES)/vim/dic-en.utf-8.add ${HOME}/.vim/dic-en.utf-8.add
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || true
	~/.fzf/install --all
	ln -fs $(DOTFILES)/vim/coc-setting.json ${HOME}/.vim/coc-settings.json
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
tflinx:	
	#Install Terraform and Packer
	sudo wget -O "/opt/terraform_latest_linux_amd64.zip" https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip
	sudo unzip -o /opt/terraform_latest_linux_amd64.zip -d /opt/
	sudo ln -fs /opt/terraform /usr/bin/terraform
	sudo wget -O "/opt/packer_latest_linux_amd64.zip" https://releases.hashicorp.com/packer/1.7.2/packer_1.7.2_linux_amd64.zip
	sudo unzip -o /opt/packer*.zip -d /opt/
	sudo ln -fs /opt/packer /usr/bin/packer
	sudo wget -O "/opt/sentinel_latest_linux_amd64.zip" https://releases.hashicorp.com/sentinel/0.18.3/sentinel_0.18.3_linux_amd64.zip
	sudo unzip -o /opt/sentinel*.zip -d /opt/
	sudo ln -fs /opt/sentinel /usr/bin/sentineli
tfls:
	# Add the HashiCorp GPG key
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
	# Add the official HashiCorp Linux repository
	sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
	sudo apt-get update && sudo apt-get install terraform-ls
