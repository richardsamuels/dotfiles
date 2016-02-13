#!/bin/sh

source ~/dotfiles/shells/sh/shellenv


if [ ! -z "$ZSH_VERSION" ]; then
    source ~/dotfiles/shells/zsh/zshenv

    if [ -f "~/dotfiles/shells/local/zshenv" ]; then
        source ~/dotfiles/shells/local/zshenv
    fi
elif [ ! -z "$BASH_VERSION" ]; then
    source ~/dotfiles/shells/bash/env.sh

    if [ -f "~/dotfiles/shells/local/env.sh" ]; then
        source ~/dotfiles/shells/local/env.sh
    fi

fi
