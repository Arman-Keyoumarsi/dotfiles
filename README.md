# dotfiles

Personal dotfiles for a consistent dev environment across macOS and Linux.

## Quick Start

```bash
git clone https://github.com/Arman-Keyoumarsi/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Or install specific components:

```bash
./install.sh bash        # Shell configs only
./install.sh vim         # Vim setup only
./install.sh git         # Git configs only
./install.sh tmux        # Tmux + TPM only
./install.sh packages    # Install packages only
```

## What Gets Installed

**Packages** (auto-detected by OS):
- Linux (apt): curl, wget, vim, tmux, ripgrep, tree, fzf, keychain
- macOS (brew): fzf, fd, ripgrep, tree, tmux

**Configs** (symlinked to `$HOME`):
- `bash/` - bash_profile, bashrc, aliases
- `vim/` - vimrc, colors, dictionary
- `git/` - gitconfig, gitignore, commit template
- `tmux/` - tmux.conf + TPM plugins
- `etc/` - custom bash completions

## Post-Install

Open vim and run `:PlugInstall` to install plugins, then `prefix + I` inside tmux to install tmux plugins.

## Structure

```
bash/           Shell configs (bash_profile, bashrc, alias)
vim/            Vim config, colorscheme, dictionary
git/            Git config, global ignore, commit template
tmux/           Tmux config
etc/            Custom bash completions
docker/         Dev container Dockerfile
archive/        Legacy scripts (reference only)
```
