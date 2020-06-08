# dotfiles :computer:

Familiar Dev Environment in any Linux server

## Prerequisite :traffic_light:

```bash
bash XXX-bootstrap.sh
```

## Install :beginner:

* Enter working directory and run:

```bash
make all
```

## VIM Plugin Installs

Open vim and run following (Install any Coc extetion you like)

```bash
:PlugInstall
:CocInstall coc-powershell coc-python coc-svg coc-yaml coc-xml coc-json
```

## Install YCM Manually (No Longer in Use)
```bash
apt install build-essential cmake vim python3-dev

cd ~/.vim/plugged/YouCompleteMe && python3 install.py
```

That is all you need to make any linux server your own.

> Feel free to fork and modify this repo in any way or shape you want!!


:clock1: :white_check_mark:
