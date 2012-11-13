#!/bin/bash

export DEFAULT_GIT_IGNORE=.gitignore_global
export DEFAULT_GIT_CONFIG=.gitconfig

check-dependencies-gitconf(){ check-if-installed git; }

vars-setgitconf(){ 
  # set name,email,ignorefile,config,token
  #git-setup.sh
  export GIT_NAME=$1
  export GIT_EMAIL=$2
  export GIT_IGNORE=$3
  export GIT_CONFIG=$4
  export GIT_TOKEN=$5; }

link-gitignore(){ make-symlink $INSTALL_PATH/gitconf/$GIT_IGNORE.$OS_TYPE $HOME_PATH/$GIT_IGNORE; }
install-git(){
  case "$OS_TYPE" in
    mac) install-git-mac;;
    ubu) install-git-ubu;;
  esac; }

#requires ruby
# create-gitconfig(){ output-todo 'create gitconfig template from ERB'; }
