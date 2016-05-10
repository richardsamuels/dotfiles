export EDITOR="/home/user/rsamuels/my/vim74/bin/vim"
export P4EDITOR="/home/user/rsamuels/my/vim74/bin/vim -c"
export P4DIFF="/home/user/rsamuels/my/vim74/bin/gvimdiff -f"
export P4MERGE="/home/user/rsamuels/my/vim74/bin/gvimdiff -f"

if [[ $TERM == "vt"* ]]; then
#else
  echo "You seem to be logging into Fonix via FDSW"
  set -vx
  export LAUNCH_DIRECTIONS_ONLY=1
  \cd ~/online
  set +vx
fi

export PS1="\n\[${Purple}\]\u\[${Color_Off}\]@\[${Blue}\]\h:\[BH_WD_START\]\[BH_WD_END\]:\[${Yellow}\]\w\[${Color_Off}\] \n\[${Green}\]\$\[${Color_Off}\] "
export PROMPT_COMMAND="bh_prompt_command;"


# Personal FactSet helper scripts
source /home/user/rsamuels/tools/dev/mh/mh.sh
source /home/user/rsamuels/tools/dev/bh/bh.sh
source ~/tools/dev/ph/ph.sh

if [ -f "~/dotfiles/git-completion.bash" ]; then
  source ~/dotfiles/git-completion.bash
fi
