#Source distribution specific location for powerline 

#Arch linux
if [ -f "/etc/arch-release" ]; 
then
  source /usr/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#Mac OS X
elif [ `uname` = "Darwin" ];
then 
  source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

source $HOME/.antigen-hs/antigen-hs/init.zsh

autoload run-help
HELPDIR=/usr/local/share/zsh/help
