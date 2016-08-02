#!/bin/bash

# ==============
# init values
# ==============

vars-setinit(){
  output-line
  ask-for-input OS_TYPE 'OS Type /(?-i)(mac|vim)/'
  ask-for-input INSTALL_NAME 'Name'
  ask-for-input INSTALL_EMAIL 'Email'
  ask-for-input INSTALL_USER_NAME 'User Name'
  ask-for-input INSTALL_GIT_USER 'Git User'
  ask-for-input INSTALL_HOME_PATH 'Home Path'
  ask-for-input INSTALL_FOLDER 'Install Folder'
  ask-for-input INSTALL_PKGMGR 'Package Manager'
  export INSTALL_PATH=$INSTALL_HOME_PATH/$INSTALL_FOLDER; }

vars-setinit-dc-mac(){
  output-todo 'replace with config file';
  export OS_TYPE=mac
  export INSTALL_NAME='David Conner'
  export INSTALL_EMAIL='dconner.pro@gmail.com'
  export INSTALL_USER_NAME=`whoami`
  export INSTALL_GIT_USER=dcunited001
  export INSTALL_HOME_PATH=$HOME
  export INSTALL_FOLDER=.files
  export INSTALL_PATH=$INSTALL_HOME_PATH/$INSTALL_FOLDER
  export INSTALL_PKGMGR=brew; }

vars-setinit-defaults-mac(){
  export DEFAULT_INSTALL_HOME_PATH="$HOME"
  export DEFAULT_INSTALL_FOLDER=".files"
  export DEFAULT_INSTALL_PKGMGR="brew"; }

vars-setinit-dc-ubu(){
  output-todo 'replace with config file';
  export OS_TYPE=ubu
  export INSTALL_NAME='David Conner'
  export INSTALL_EMAIL='dconner.pro@gmail.com'
  export INSTALL_USER_NAME=`whoami`
  export INSTALL_GIT_USER=dcunited001
  export INSTALL_HOME_PATH=$HOME
  export INSTALL_FOLDER=.files
  export INSTALL_PATH=$INSTALL_HOME_PATH/$INSTALL_FOLDER
  export INSTALL_PKGMGR=apt-get; }

vars-setinit-defaults-ubu(){
  export DEFAULT_INSTALL_HOME_PATH="$HOME"
  export DEFAULT_INSTALL_FOLDER=".files"
  export DEFAULT_INSTALL_PKGMGR="apt-get"; }

# ==============
# menu helpers
# ==============

menu-main(){
  opts=(
    'get-user-info'
    'output-info'
    'menu-setup'
    'exit' )
  menu-for ${opts[@]};
  menu-main; }

menu-setup(){
  opts=(
    'check-dependencies-init'
    'setup-bash'
    'setup-emacs'
    'setup-gitconf'
    'setup-iterm'
    'setup-kbd'
    'setup-ryanb'
    'setup-subl'
    'setup-tmux'
    'setup-vim'
    'setup-zsh'
    'menu-main'
    'menu-exit' )
  menu-for ${opts[@]};
  menu-setup; }

menu-for(){
  output-line
  output-menu $@
  output-line
  $(menu-selection $@); }

#always include menu-exit in options
menu-selection(){
  local choice;
  while [[ -z $choice ]]; do
    choice=$(menu-choice $@)
  done;
  echo $choice; }

menu-choice(){ local c; read c; echo ${!c}; } #probably not secure
menu-exit(){ echo 'exiting'; exit 0; }

output-menu(){
  echo 'Select # or exit..'
  local optnum=1
  local arg
  for arg in $@; do
    echo "$optnum) $arg"
    optnum=$[optnum + 1]
  done; }

output-line(){ echo "==========================="; }
output-info(){
  output-line
  echo "          OS_TYPE - $OS_TYPE"
  echo "     INSTALL_NAME - $INSTALL_NAME"
  echo "    INSTALL_EMAIL - $INSTALL_EMAIL"
  echo "     INSTALL_PATH - $INSTALL_PATH"
  echo "INSTALL_HOME_PATH - $INSTALL_HOME_PATH"
  echo "INSTALL_USER_NAME - $INSTALL_USER_NAME"
  echo " INSTALL_GIT_USER - $INSTALL_GIT_USER"
  output-line; }

ask-for-input(){
  local defval=$(get-default $1);
  [[ -z $defval ]] && defval='N/A'
  echo "  Enter $1: [$defval]";
  local rdval; read rdval;
  resolve-and-set $1 $rdval; }

ask-when-empty(){ output-todo 'ask-when-empty()'; }

output-todo(){  [[ $TODO_OUT  -eq 'TODO'  ]] && { echo TODO: $1; } }
output-warn(){  [[ $TODO_OUT  -eq 'TODO'  ]] && { echo TODO: $1; } }
output-error(){ [[ $ERROR_OUT -eq 'ERROR' ]] && { echo ERROR-$1: $2; return $1; } }
output-die(){   [[ $FATAL_OUT -eq 'FATAL' ]] && { echo FATAL-$1: $2; exit $1; } }

output-error-or-die(){ msg=$1; lvl=1
  while getopts ":d:l" opt; do
    case $opt in
      d) die='-d';;
      l) echo $OPTARG; echo $OPTIND; lvl=$OPTARG;;
    esac
  done

  #TO FIX: DOWNLOAD GNU-GETOPT

  #echo $die;
  #[[ -z $die ]] && echo 'fdsa'
 # [[ -z $fdsdie ]] && echo 'fdsafdafdfdsa'; }

  #[[ -z $die ]] && output-error $lvl $msg || output-die $lvl $msg; }
  #[[ -z $die ]] && output-die $lvl $msg || output-error $lvl $msg; }
  [[ ! -z $die ]] && output-die $lvl $msg || output-error $lvl $msg; }

# ==============
# misc helpers
# ==============

get-default-name(){ echo "DEFAULT_${1}"; }
get-default(){ local defname=$(get-default-name $1); echo ${!defname}; }
resolve-and-set(){
  if [[ -z $2 ]]; then { resolve-to-default $1; }
  else { export ${1}=$2; }
  fi; }
resolve-to-default(){
  if [[ -z $DEFAULT_${1} ]]; then { output-error 1 "Define: $(get-default-name $1) (No Default)"; }
  else { export ${1}="$(get-default $1)"; }
  fi; }

make-symlink(){
  echo "    Linking $2"
  if [[ -h $2 ]]; then { echo "      Skip: $2 - skipping"; }
  elif [[ -d "$2" ]]; then { output-error 1 "      Dir Exists: $2"; }
  elif [[ -e "$2" ]]; then { output-error 1 "      File Exists: $2"; }
  elif [[ ! -e "$1" ]]; then { output-die 1 "      Source Not Found: $1"; }
  else { echo "      => $1"; ln -s $1 $2; }
  fi; }

mkdir-if-missing(){
  echo "    Create Dir: $1"
  if [[ -d $1 ]]; then { echo "      Skip: Create Dir: $1"; }
  elif [[ -e $1 ]]; then { output-die 1 "Error: file is not directory. $1"; }
  else { mkdir $1; }
  fi; }

check-for-file(){
  msg="File Required"
  lvl=1
  while getopts ":d:ml" opt; do
    case $opt in
      d) die='-d';;
      m) msg=$OPTARG;;
      l) lvl="-l $OPTARG";;
    esac
  done

  echo "    Checking File: $1"
  [[ ! -e $1 ]] && output-error-or-die $lvl $die $msg || echo Found; }

check-for-dir(){
  echo "    Checking Dir: $1."
  [[ ! -d "$1" ]] && { output-die 1 "Directory required: $1 $2"; } }

check-if-installed(){
  for arg in $@; do {
    echo "    Checking: $arg"
    command -v $1 >/dev/null 2>&1 || { output-die "$arg is required."; } }; done; }

check-dependencies-init(){
  case "$OS_TYPE" in
    mac) check-if-installed brew;;
    ubu) check-if-installed apt-get;;
  esac
  check-if-installed curl git ruby perl
  output-todo 'dependencies?'; }

# ==============
# setup helpers
# ==============

source-all-scripts(){
  source $INSTALL_PATH/init/support.sh
  source $INSTALL_PATH/init/bash-setup.sh
  source $INSTALL_PATH/init/emacs-setup.sh
  source $INSTALL_PATH/init/gitconf-setup.sh
  source $INSTALL_PATH/init/iterm-setup.sh
  source $INSTALL_PATH/init/kbd-setup.sh
  source $INSTALL_PATH/init/ryanb-setup.sh
  source $INSTALL_PATH/init/subl-setup.sh
  source $INSTALL_PATH/init/tmux-setup.sh
  source $INSTALL_PATH/init/vim-setup.sh
  source $INSTALL_PATH/init/zsh-setup.sh; }

# setup-secure(){
#   source $INSTALL_PATH/init/secure-setup.sh
#   vars-setsecurepath $DEFAULT_SEC_PATH; }

# converts a mac osx prefpane *.plist file to xml from binary
convert-plist(){
  [[ ! -z $2 ]] && convformat=$2 || convformat=xml1
  [[ ! -e $1 ]] && output-die "File "
  echo "Converting Pref Pane to .$convformat: $1"
  plutil -convert $convformat -o ~/.files/$1 $1
}
