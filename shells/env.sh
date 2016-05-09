#!/bin/sh

source ${HOME}/dotfiles/shells/uenv

if [ ! -z "$ZSH_VERSION" ]; then
  source ${HOME}/dotfiles/shells/zshenv

  if [ -f "${HOME}/dotfiles/local/zsh/zshenv" ]; then
    source ${HOME}/dotfiles/local/zsh/zshenv
  fi

elif [ ! -z "$BASH_VERSION" ]; then
  if [ -f "${HOME}/dotfiles/local/bash/bashenv" ]; then
    source ${HOME}/dotfiles/local/bash/bashenv
  fi

fi

# vim: set ft=sh :
