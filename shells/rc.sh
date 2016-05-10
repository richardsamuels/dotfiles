#!/bin/sh

if [ -f "${HOME}/dotfiles/local/zsh/pre.urc" ]; then
  source ${HOME}/dotfiles/local/shells/pre.urc
fi

if [ ! -z "$ZSH_VERSION" ]; then
  if [ -f "${HOME}/dotfiles/local/zsh/pre.zshrc" ]; then
    source ${HOME}/dotfiles/local/zsh/pre.zshrc
  fi

elif [ ! -z "$BASH_VERSION" ]; then
  if [ -f "${HOME}/dotfiles/local/bash/pre.bashrc" ]; then
    source ${HOME}/dotfiles/local/bash/pre.bashrc
  fi

fi

# Source universal RC
source ${HOME}/dotfiles/shells/urc

if [ ! -z "$ZSH_VERSION" ]; then
  source ${HOME}/dotfiles/shells/zshrc

  if [ -f "${HOME}/dotfiles/local/zsh/zshrc" ]; then
    source ${HOME}/dotfiles/local/zsh/zshrc
  fi

elif [ ! -z "$BASH_VERSION" ]; then
  # inferior shells don't separate environment and rc
  # LANG is set in uenv, so source that if it hasn't been set
  if [ -z "${LANG}" ]; then
    source ${HOME}/dotfiles/shells/env.sh 
  fi
  source ${HOME}/dotfiles/shells/bashrc

  if [ -f "${HOME}/dotfiles/local/bash/bashrc" ]; then
    source ${HOME}/dotfiles/local/bash/bashrc
  fi

fi

# vim: set ft=sh :
