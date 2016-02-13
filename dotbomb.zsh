#!/bin/zsh

cp -f ./dotbomb/.* ~/
cp -f hooks/* ./.git/hooks

git clone git@github.com:Tarrasch/antigen-hs.git ~/.antigen-hs/antigen-hs
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/undodir
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized

ln -s ~/dotfiles/shells/zsh/MyAntigen.hs ~/.antigen-hs/MyAntigen.hs
ln -s ~/dotfiles/ssh/config ~/.ssh/config

vim +PluginInstall +qall

source ~/.antigen-hs/antigen-hs/init.zsh

antigen-hs-compile

cd $ANTIGEN_HS_OUT/repos/https-COLON--SLASH--SLASH-github.com-SLASH-jimeh-SLASH-tmuxifier/

curl https://gist.githubusercontent.com/richardsamuels/a0f0d29e1d3c4d2ec5b0/raw/9c3355cdd2632f11ac3da8863eca4fef4272da97/tmuxifier.plugin.zsh > tmuxifier.plugin.zsh

antigen-hs-compile
git submodule init
git submodule update
echo "Dotbombed! Restart your shell"

