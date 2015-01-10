#!/bin/sh

cp -rf dotbomb/* ~/

git clone git@github.com:Tarrasch/antigen-hs.git ~/.antigen-hs/antigen-hs
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/.antigen-hs/MyAntigen.hs ~/dotfiles/MyAntigen.hs

vim +PluginInstall +qall
antigen-hs-compile