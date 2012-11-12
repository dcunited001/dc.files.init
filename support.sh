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
  if [[ -z $3 ]]; then
    echo "  Enter $2: [ $3 ]"
    read $1
    # if empty, set as default
    [[ -z `echo $1` ]] && { export `echo $1`=$3; }
  else
    echo "  Enter $2: [ (No Default) ]"
    read $1
  fi
  echo "TODO: defaults"
}

make-symlink()
{
  echo "    Linking $2"
  if [[ -h $2 ]]; then
    echo "      LINK EXISTS: $2 skipping.."
  elif [[ -d "$2" ]]; then
    echo "      DIR EXISTS: $2 aborting.."
    exit
  elif [[ -e "$2" ]]; then
    echo "      FILE EXISTS: $2 aborting.."
    exit
  elif [[ ! -e "$1" ]]; then
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
  if [[ -d $1 ]]; then
    echo "      Skip: Create Dir: $1"
  elif [[ -e $1 ]]; then
    echo "      Error: file is not directory."
    exit
  else
    mkdir $1
  fi
}

check-for-dir()
{
  echo "    Checking Dir: $1."
  [[ ! -d "$1" ]] && { echo "      Directory $1 required"; exit; }
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

check-dependencies-init()
{
  case "$OS_TYPE" in
    mac)
      check-if-installed brew
      ;;
    ubu)
      #check sudo?
      check-if-installed apt-get
      ;;
  esac
  check-if-installed git
  check-if-installed ruby
  check-if-installed perl
  echo 'TODO: dependencies?'
}

# ==============
# setup helpers
# ==============

# setup-secure()
# {
#   source $INSTALL_PATH/init/secure-setup.sh
#   vars-setsecurepath $DEFAULT_SEC_PATH
# }

setup-gitconf()
{
  # fetch git token
  # export GIT_TOKEN_SECURE=

  source $INSTALL_PATH/init/gitconf-setup.sh
  check-dependencies-gitconf
  vars-setgitconf $NAME $EMAIL $DEFAULT_GIT_IGNORE $DEFAULT_GIT_CONFIG $GIT_TOKEN_SECURE
  link-gitignore
  echo 'TODO: gitconfig.erb'
}

setup-iterm()
{
  source $INSTALL_PATH/init/iterm-setup.sh
  check-dependencies-iterm
  vars-iterm
  link-iterm
}

setup-kbd()
{
  source $INSTALL_PATH/init/kbd-setup.sh
  check-dependencies-kbd
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
  check-dependencies-subl
  vars-subl
  link-subl
}

setup-tmux()
{ 
  source $INSTALL_PATH/init/tmux-setup.sh
  check-dependencies-tmux
  vars-tmux
  link-tmux-conf
  echo 'TODO: setup tmuxinator'
  link-kbd-bindings 'tmux'
}

setup-ryanb()
{ 
  source $INSTALL_PATH/init/ryanb-setup.sh
  check-dependencies-ryanb
  vars-ryanb
  link-gemrc
  link-irbrc
}

setup-janus()
{
  source $INSTALL_PATH/init/janus-setup.sh
  check-dependencies-janus
  mkdir-if-missing $HOME_PATH/.vim
  make-janus-plugin-folder
  link-janus-folder
  link-janus-rakefile
  exec-janus-rake
}

setup-vim()
{
  source $INSTALL_PATH/init/vim-setup.sh
  check-dependencies-vim
  mkdir-if-missing $HOME_PATH/.vim
  link-vimrc
  link-gvimrc
  link-kbd-bindings 'vim'
  link-vim-colors
  setup-vim-plugins
  # make-symlink $INSTALL_PATH/janus/janus $HOME_PATH/.vim/janus
}

setup-emacs()
{
  # source $INSTALL_PATH/init/emacs-setup.sh
  # check-dependencies-emacs
  # mkdir-if-missing $HOME_PATH/.emacs
  # link-kbd-bindings 'emacs'
  echo 'TODO: setup emacs'
}

setup-zsh()
{
  source $INSTALL_PATH/init/zsh-setup.sh
  check-dependencies-zsh
  vars-set-zsh
  link-omz
  link-zshrc
  link-kbd-bindings 'zsh'
}

setup-bash()
{
  source $INSTALL_PATH/init/bash-setup.sh
  check-dependencies-bash
  vars-setbash
  link-kbd-bindings 'bash'
}
