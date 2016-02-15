#!/bin/sh

if [ ! -z "$ZSH_VERSION" ]; then
    source ~/dotfiles/shells/rc/urc
    source ~/dotfiles/shells/rc/zshrc

    if [ -f "~/dotfiles/shells/local/zshrc" ]; then
        source ~/dotfiles/shells/local/zshrc
    fi
elif [ ! -z "$BASH_VERSION" ]; then
    # inferior shells don't separate environment and rc
    source ~/dotfiles/shells/env.sh
    source ~/dotfiles/shells/rc/urc
    source ~/dotfiles/shells/rc/bashrc

    if [ -f "~/dotfiles/shells/local/bashrc" ]; then
        source ~/dotfiles/shells/local/bashrc
    fi
fi

# vim: set ft=sh :
