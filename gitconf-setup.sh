#!/bin/bash

export DEFAULT_GIT_IGNORE=.gitignore_global
export DEFAULT_GIT_CONFIG=.gitconfig

setup-gitconf() {
  check-dependencies-gitignore
  vars-setgitconf $INSTALL_NAME $INSTALL_EMAIL $DEFAULT_GIT_IGNORE $DEFAULT_GIT_CONFIG $GIT_TOKEN_SECURE
  opts=(
    'check-dependencies-gitignore'
    'link-gitignore'
    # 'unlink-gitignore'
    'check-dependencies-gitconfig-erb'
    #'fetch-gitconfig-token'
    'create-gitconfig-from-erb'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-gitconf; }

check-dependencies-gitignore(){ check-if-installed git; }
check-dependencies-gitconf-erb(){ check-if-installed ruby rake; }

vars-setgitconf(){
  export GIT_NAME=$1
  export GIT_EMAIL=$2
  export GIT_IGNORE=$3
  export GIT_CONFIG=$4
  export GIT_TOKEN=$5; }

link-gitignore(){ make-symlink $INSTALL_PATH/gitconf/$GIT_IGNORE.$OS_TYPE $HOME_PATH/$GIT_IGNORE; }
create-gitconfig-from-erb(){ check-dependencies-gitconfig-erb; output-todo 'create gitconfig template from ERB'; }
