#!/bin/bash

dcdotfiles-make-symlink()
{
  if [ -f "$2" ]
  then
    echo "FILE EXISTS: $2 aborting.."
    exit
  elif [ ! -f "$1" ]
  then
    echo "FILE DOES NOT EXIST: $1 aborting"
    exit
  else
    echo "    Linking $2"
    echo "      => $1"
    ln -s $1 $2
  fi
}

dcdotfiles-zsh-default()
{
  chsh -s /bin/zsh
}

dcdotfiles-bash-default()
{
  chsh -s /bin/bash
}

# ==============
# setup helpers
# ==============

dcdotfiles-setup-secure()
{
  source $INSTALL_PATH/init/secure-setup.sh
  dcdotfiles-vars-setsecurepath $DEFAULT_SEC_PATH
}

dcdotfiles-setup-gitconf()
{
  # fetch git token
  export GIT_TOKEN_SECURE=

  source $INSTALL_PATH/init/gitconf-setup.sh
  dcdotfiles-vars-setgitconf $NAME $EMAIL $DEFAULT_GIT_IGNORE $DEFAULT_GIT_CONFIG $GIT_TOKEN_SECURE
  dcdotfiles-link-gitignore
}

dcdotfiles-setup-iterm()
{
  source $INSTALL_PATH/init/iterm-setup.sh
  dcdotfiles-vars-iterm
  dcdotfiles-link-iterm
}

dcdotfiles-setup-kbd()
{
  source $INSTALL_PATH/init/kbd-setup.sh
  dcdotfiles-vars-setkbd
  case "$OS_TYPE" in
    mac)
      dcdotfiles-setup-kbd-mac
      ;;
    ubu)
      dcdotfiles-setup-kbd-ubu
      ;;
  esac
}

dcdotfiles-setup-subl()
{
  source $INSTALL_PATH/init/subl-setup.sh
  dcdotfiles-vars-subl
  dcdotfiles-link-subl
}

dcdotfiles-setup-tmux()
{
  source $INSTALL_PATH/init/tmux-setup.sh
  echo 'TODO: setup tmux'
}

dcdotfiles-setup-ryanb()
{
  source $INSTALL_PATH/init/ryanb-setup.sh
  dcdotfiles-link-gemrc
  dcdotfiles-link-irbrc
  #link to vim plugins?
}

dcdotfiles-setup-janus()
{
  echo 'TODO: setup janus'
}

dcdotfiles-setup-vim()
{
  echo 'TODO: setup vim'
}

dcdotfiles-setup-zsh()
{
  echo 'TODO: setup zsh'
}

dcdotfiles-setup-bash()
{
  echo 'TODO: setup bash '
}
