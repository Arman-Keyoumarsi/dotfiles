#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Check for Homebrew on macOS
check_brew() {
    if [[ "$OSTYPE" == "darwin"* ]] && ! command -v brew &>/dev/null; then
        echo "Homebrew not found. Install it from https://brew.sh"
        exit 1
    fi
}

# Check for git
check_git() {
    if ! command -v git &>/dev/null; then
        echo "git not found. Please install git first."
        exit 1
    fi
}

check_git

if [[ $# -eq 0 ]]; then
    check_brew
    echo "Installing dotfiles..."
    make -C "$DOTFILES" all
else
    for target in "$@"; do
        case "$target" in
            packages)
                check_brew
                make -C "$DOTFILES" packages
                ;;
            bash|vim|git|tmux)
                make -C "$DOTFILES" "$target"
                ;;
            *)
                echo "Unknown target: $target"
                echo "Usage: $0 [bash|vim|git|tmux|packages]"
                exit 1
                ;;
        esac
    done
fi

echo "Done."
