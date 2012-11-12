#!/bin/bash

vars-setinit()
{
  ask-for-input INSTALL_HOME_PATH 'Home Path'
  ask-for-input INSTALL_FOLDER 'Install Folder', '.files'
  ask-for-input OS_TYPE 'OS Type /(?-i)(mac|vim)/', 'mac'
  ask-for-input INSTALL_NAME 'Name'
  ask-for-input INSTALL_EMAIL 'Email'
  ask-for-input INSTALL_USER_NAME 'User Name'
  ask-for-input INSTALL_GIT_USER 'Git User'
  export INSTALL_PATH=$INSTALL_HOME_PATH/$INSTALL_FOLDER
}

ask-for-input()
{
  echo "Enter $2:"
  read $1
  echo "TODO: defaults"
}

make-symlink()
{
  echo "    Linking $2"
  if [ -h "$2" ]; then
    echo "      LINK EXISTS: $2 skipping.."
  if [ -d "$2" ]; then
    echo "      DIR EXISTS: $2 aborting.."
    exit
  elif [ -e "$2" ]; then
    echo "      FILE EXISTS: $2 aborting.."
    exit
  elif [ ! -e "$1" ]; then
    echo "      SOURCE DOES NOT EXIST: $1 aborting"
    exit
  else
    echo "      => $1"
    ln -s $1 $2
  fi
}

mkdir-if-missing()
{
  echo "    Create Dir: $1"
  if [ -d "$1" ]; then
    echo "      Skip: Create Dir: $1"
  elif [ -e "$1" ]; then
    echo "      Error: file is not directory."
    exit
  else
    mkdir $1
  fi
}

check-for-dir()
{
  echo "    Checking Dir: $1."
  [[ ! -d "$1" ]] && 
}

check-if-installed()
{
  echo "    Checking: $1"
  command -v $1 >/dev/null 2>&1 || { echo "      $1 is required." >&2; exit 1; }
}

zsh-default()
{
  chsh -s /bin/zsh
}

bash-default()
{
  chsh -s /bin/bash
}

# ==============
# setup helpers
# ==============

setup-secure()
{
  source $INSTALL_PATH/init/secure-setup.sh
  vars-setsecurepath $DEFAULT_SEC_PATH
}

setup-gitconf()
{
  # fetch git token
  # export GIT_TOKEN_SECURE=

  source $INSTALL_PATH/init/gitconf-setup.sh
  vars-setgitconf $NAME $EMAIL $DEFAULT_GIT_IGNORE $DEFAULT_GIT_CONFIG $GIT_TOKEN_SECURE
  link-gitignore
}

setup-iterm()
{
  source $INSTALL_PATH/init/iterm-setup.sh
  vars-iterm
  link-iterm
}

setup-kbd()
{
  source $INSTALL_PATH/init/kbd-setup.sh
  vars-setkbd
  case "$OS_TYPE" in
    mac)
      setup-kbd-mac
      ;;
    ubu)
      setup-kbd-ubu
      ;;
  esac
}

setup-subl()
{
  source $INSTALL_PATH/init/subl-setup.sh
  vars-subl
  link-subl
}

setup-tmux()
{
  source $INSTALL_PATH/init/tmux-setup.sh
  echo 'TODO: setup tmux'
}

setup-ryanb()
{
  source $INSTALL_PATH/init/ryanb-setup.sh
  link-gemrc
  link-irbrc
  #link to vim plugins?
}

setup-janus()
{
  echo 'TODO: setup janus'
}

setup-vim()
{
  echo 'TODO: setup vim'
}

setup-zsh()
{
  echo 'TODO: setup zsh'
}

setup-bash()
{
  echo 'TODO: setup bash '
}
