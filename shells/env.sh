#!/bin/sh

# source pre-environment if needed
if [ -f "${HOME}/dotfiles/local/shells/pre.uenv" ]; then
  source ${HOME}/dotfiles/local/shells/pre.uenv
fi

if [ ! -z "$ZSH_VERSION" ]; then

  if [ -f "${HOME}/dotfiles/local/zsh/pre.zshenv" ]; then
    source ${HOME}/dotfiles/local/zsh/pre.zshenv
  fi

elif [ ! -z "$BASH_VERSION" ]; then

  if [ -f "${HOME}/dotfiles/local/bash/pre.bashenv" ]; then
    source ${HOME}/dotfiles/local/bash/pre.bashenv
  fi
fi

# Source Universal Environment
source ${HOME}/dotfiles/shells/uenv

# Source Shell-specific environment
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
