#!/bin/sh

source ~/dotfiles/shells/env/uenv

if [ ! -z "$ZSH_VERSION" ]; then
    source ~/dotfiles/shells/env/zshenv

    if [ -f "~/dotfiles/shells/local/zshenv" ]; then
        source ~/dotfiles/shells/local/zshenv
    fi
elif [ ! -z "$BASH_VERSION" ]; then

    if [ -f "~/dotfiles/shells/local/bashenv" ]; then
        source ~/dotfiles/shells/local/bashenv
    fi

fi

# vim: set ft=sh :
