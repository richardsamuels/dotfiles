#!/bin/zsh

cp -f ./dotbomb/.* ${HOME}/
mv ${HOME}/.nvimrc ${HOME}/.config/nvim/init.vim
cp -f hooks/* ./.git/hooks

mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ${HOME}/dotfiles/ssh/config ${HOME}/.ssh/config

vim +PlugInstall

git submodule init
git submodule update
mkdir ~/.z
echo "Dotbombed! Restart your shell"
