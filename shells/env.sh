#!/bin/sh

source ${HOME}/dotfiles/shells/uenv

if [ ! -z "$ZSH_VERSION" ]; then
    source ${HOME}/dotfiles/shells/zshenv

    if [ -f "${HOME}/dotfiles/shells/local/zshenv" ]; then
        source ${HOME}/dotfiles/shells/local/zshenv
    fi

elif [ ! -z "$BASH_VERSION" ]; then
    if [ -f "${HOME}/dotfiles/shells/local/bashenv" ]; then
        source ${HOME}/dotfiles/shells/local/bashenv
    fi

fi

# vim: set ft=sh :
