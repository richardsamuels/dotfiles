#!/bin/sh

if [ ! -z "$ZSH_VERSION" ]; then
    source ${HOME}/dotfiles/shells/urc
    source ${HOME}/dotfiles/shells/zshrc

    if [ -f "${HOME}/dotfiles/local/zsh/zshrc" ]; then
        source ${HOME}/dotfiles/local/zsh/zshrc
    fi

elif [ ! -z "$BASH_VERSION" ]; then
    # inferior shells don't separate environment and rc
    source ${HOME}/dotfiles/shells/urc
    source ${HOME}/dotfiles/shells/bashrc

    if [ -f "${HOME}/dotfiles/local/bash/bashrc" ]; then
        source ${HOME}/dotfiles/local/bash/bashrc
    fi

fi

# vim: set ft=sh :
