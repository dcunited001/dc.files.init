#!/bin/bash

export DEFAULT_SUBL_SETTINGS_PATH_MAC='/Library/Application Support/Sublime Text 2/Packages/User'
export DEFAULT_SUBL_SETTINGS_USERFILE_MAC='Preferences.sublime-settings'
export DEFAULT_SUBL_SETTINGS_PATH_UBU=
export DEFAULT_SUBL_SETTINGS_USERFILE_UBU=

setup-subl(){
  check-dependencies-subl
  opts=(
    'vars-setsubl'
    'link-subl-settings'
    #'backup-subl-settings'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-subl; }

# setup-subl(){ 
#   source $INSTALL_PATH/init/subl-setup.sh
#   check-dependencies-subl
#   vars-setsubl
#   link-subl; }

check-dependencies-subl(){ output-todo 'check-dependencies-subl'; }
vars-setsubl(){
  output-todo 'sublime plugins/settings' # export SUBL_PLUGINS_PATH=$2
  ask-for-input 'SUBL_SETTINGS_PATH'
  ask-for-input 'SUBL_SETTINGS_USERFILE'; }

vars-setsubl-path(){ make-symlink }
link-subl-settings(){ make-symlink $INSTALL_PATH/subl/$SUBL_SETTINGS_FILE $SUBL_SETTINGS_PATH/$SUBL_SETTINGS_FILE; }
backup-subl-settings(){ output-todo 'backup subl settings'; }

