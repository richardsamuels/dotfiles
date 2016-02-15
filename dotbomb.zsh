#!/bin/zsh

cp -f ./dotbomb/.* ~/
cp -f hooks/* ./.git/hooks

mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/undodir
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dotfiles/ssh/config ~/.ssh/config

vim +PlugInstall

cd $ANTIGEN_HS_OUT/repos/https-COLON--SLASH--SLASH-github.com-SLASH-jimeh-SLASH-tmuxifier/

git submodule init
git submodule update
echo "Dotbombed! Restart your shell"

