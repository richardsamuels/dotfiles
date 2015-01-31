#!/bin/zsh

cp -f ./dotbomb/.* ~/
cp -f hooks/* ./.git/hooks

git clone git@github.com:Tarrasch/antigen-hs.git ~/.antigen-hs/antigen-hs
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

ln -s ~/dotfiles/zsh/MyAntigen.hs ~/.antigen-hs/MyAntigen.hs
ln -s ~/dotfiles/ssh/config ~/.ssh/config

vim +PluginInstall +qall

source ~/.antigen-hs/antigen-hs/init.zsh


antigen-hs-compile

echo "Dotbombed! Restart your shell"

