#!/bin/bash

export DEFAULT_GIT_IGNORE=.gitignore_global
export DEFAULT_GIT_CONFIG=.gitconfig

setup-gitconf() {
  DEFAULT_GIT_NAME=$INSTALL_NAME
  DEFAULT_GIT_EMAIL=$INSTALL_EMAIL
  check-dependencies-gitignore
  # output-gitinfo
  opts=(
    'check-dependencies-gitignore'
    'vars-setgitinfo'
    'vars-setgittoken'
    'output-gitinfo'
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

vars-setgitinfo(){
  ask-for-input GIT_NAME
  ask-for-input GIT_EMAIL; }
output-gitinfo(){
  echo "      Name: $GIT_NAME"
  echo "     Email: $GIT_EMAIL"
  echo " Git Token: $GIT_TOKEN"; }

vars-setgittoken(){ ask-for-input GIT_TOKEN; }
link-gitignore(){ make-symlink $INSTALL_PATH/gitconf/$DEFAULT_GIT_IGNORE.$OS_TYPE $INSTALL_HOME_PATH/$DEFAULT_GIT_IGNORE; }
create-gitconfig-from-erb(){ check-dependencies-gitconfig-erb; output-todo 'create gitconfig template from ERB'; }
