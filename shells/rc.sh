#!/bin/sh



if [ ! -z "$ZSH_VERSION" ]; then
    source ~/dotfiles/shells/sh/shellrc
    source ~/dotfiles/shells/zsh/zshrc

    if [ -f "~/dotfiles/shells/local/zshrc" ]; then
        source ~/dotfiles/shells/local/zshrc
    fi
elif [ ! -z "$BASH_VERSION" ]; then
    # inferior shells don't separate environment and rc
    source ~/dotfiles/shells/env.sh
    source ~/dotfiles/shells/sh/shellrc
    source ~/dotfiles/shells/bash/bashrc

    if [ -f "~/dotfiles/shells/local/bashrc" ]; then
        source ~/dotfiles/shells/local/bashrc
    fi
fi
