#!/bin/zsh

cp -f ./dotbomb/.* ~/
cp -f hooks/* ./.git/hooks

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

vim +PluginInstall +qall


echo "Dotbombed! Restart your shell"

