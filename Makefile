.PHONY: esse bash tmux vim git qute #apps
all: .PHONY
DOTFILES := $(shell pwd)

esse:
	sudo apt install -y build-essential cmake vim python3-dev ripgrep curl wget

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
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || true
	~/.fzf/install --all
	git clone --depth 1 https://github.com/ycm-core/YouCompleteMe.git ~/.vim/plugged/YouCompleteMe || true 
git:
	ln -fs $(DOTFILES)/git/gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/git/gitcommit ${HOME}/.gitcommit
	ln -fs $(DOTFILES)/git/gitignore ${HOME}/.gitignore
tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	ln -fs $(DOTFILES)/tmux/tmux.conf ${HOME}/.tmux.conf
apps:
	sudo ln -fs ${DOTFILES}/apps/terraform/terraform /usr/bin/terraform
	
