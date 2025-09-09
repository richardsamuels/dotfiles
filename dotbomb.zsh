#!/bin/zsh

cp -f ./dotbomb/.* ${HOME}/
cp -f hooks/* ./.git/hooks

ln -s ${HOME}/dotfiles/ssh/config ${HOME}/.ssh/config
ln -s ${HOME}/dotfiles/nvim ${HOME}/.config/nvim

git submodule init
git submodule update
touch ~/.z
if [[ `uname` == "Darwin" ]]; then
    defaults write com.apple.Dock appswitcher-all-displays -bool true
    killall Dock
    softwareupdate –-background --install-rosetta --agree-to-license
    brew install fzy
    brew install rg
    brew install fd
    brew install rustup
fi
echo "Dotbombed! Restart your shell"
