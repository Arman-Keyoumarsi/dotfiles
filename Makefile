.PHONY: bash tmux vim git qute apps
all: .PHONY
DOTFILES := $(shell pwd)

bash:
	ln -fs ${DOTFILES}/bash/alias ${HOME}/.alias
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
git:
	ln -fs $(DOTFILES)/git/gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/git/gitcommit ${HOME}/.gitcommit
	ln -fs $(DOTFILES)/git/gitignore ${HOME}/.gitignore
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	ln -fs $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf
apps:
	ln -fs ${DOTFILES}/apps/terraform/terraform /usr/bin/terraform
	#Install FZF
	#git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	#~/.fzf/install
	# Install Azure CLI
	curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
	# Install Google Cloud CLI
	echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
	sudo apt-get install apt-transport-https ca-certificates gnupg
	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
	sudo apt-get update && sudo apt-get install google-cloud-sdk
