#!/bin/zsh

cp -f ./dotbomb/.* ~/
cp -f hooks/* ./.git/hooks

git clone git@github.com:Tarrasch/antigen-hs.git ~/.antigen-hs/antigen-hs
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/undodir
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

ln -s ~/dotfiles/zsh/MyAntigen.hs ~/.antigen-hs/MyAntigen.hs
ln -s ~/dotfiles/ssh/config ~/.ssh/config

vim +PluginInstall +qall

source ~/.antigen-hs/antigen-hs/init.zsh

antigen-hs-compile

cd $ANTIGEN_HS_OUT/repos/https-COLON--SLASH--SLASH-github.com-SLASH-jimeh-SLASH-tmuxifier/

curl https://gist.githubusercontent.com/richardsamuels/a0f0d29e1d3c4d2ec5b0/raw/9c3355cdd2632f11ac3da8863eca4fef4272da97/tmuxifier.plugin.zsh > tmuxifier.plugin.zsh

antigen-hs-compile
echo "Dotbombed! Restart your shell"

