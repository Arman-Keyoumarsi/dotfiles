.PHONY: all bash vim git tmux zsh packages
DOTFILES := $(shell pwd)

all: packages bash vim git tmux

bash:
	ln -fs $(DOTFILES)/bash/alias $(HOME)/.alias
	ln -fs $(DOTFILES)/bash/alias $(HOME)/.bash_aliases
	ln -fns $(DOTFILES)/etc/ $(HOME)/etc
	ln -fs $(DOTFILES)/bash/bashrc $(HOME)/.bashrc
	ln -fs $(DOTFILES)/bash/bash_profile $(HOME)/.bash_profile

vim:
	mkdir -p $(HOME)/.vim/swap
	mkdir -p $(HOME)/.vim/backup
	mkdir -p $(HOME)/.vim/undo
	ln -fns $(DOTFILES)/vim/colors $(HOME)/.vim/colors
	ln -fs $(DOTFILES)/vim/vimrc $(HOME)/.vimrc
	ln -fs $(DOTFILES)/vim/dic-en.utf-8.add $(HOME)/.vim/dic-en.utf-8.add

git:
	ln -fs $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig
	ln -fs $(DOTFILES)/git/gitcommit $(HOME)/.gitcommit
	ln -fs $(DOTFILES)/git/gitignore $(HOME)/.gitignore

tmux:
	git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm || true
	ln -fs $(DOTFILES)/tmux/tmux.conf $(HOME)/.tmux.conf

zsh:
ifeq ($(shell uname -s),Darwin)
	ln -fs $(DOTFILES)/zsh/zshenv $(HOME)/.zshenv
	ln -fs $(DOTFILES)/zsh/zprofile $(HOME)/.zprofile
	ln -fs $(DOTFILES)/zsh/zshrc $(HOME)/.zshrc
	ln -fs $(DOTFILES)/bash/alias $(HOME)/.alias
	ln -fns $(DOTFILES)/etc/ $(HOME)/etc
	brew install zsh-syntax-highlighting zsh-autosuggestions 2>/dev/null || true
else
	@echo "zsh target is macOS-only"
endif

packages:
ifeq ($(shell uname -s),Linux)
	sudo apt-get update
	sudo apt-get install -y curl wget vim tmux ripgrep tree keychain
	git clone --depth 1 https://github.com/junegunn/fzf.git $(HOME)/.fzf || true
	$(HOME)/.fzf/install --all --no-update-rc
endif
ifeq ($(shell uname -s),Darwin)
	brew install fzf fd ripgrep tree tmux
endif
