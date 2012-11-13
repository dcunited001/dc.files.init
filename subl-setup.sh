#!/bin/bash

check-dependencies-subl(){ output-todo 'check-dependencies-subl' }

DEFAULT_SUBL_SETTINGS_PATH_MAC='/Library/Application Support/Sublime Text 2/Packages/User'
DEFAULT_SUBL_SETTINGS_USERFILE_MAC='Preferences.sublime-settings'
DEFAULT_SUBL_SETTINGS_PATH_UBU=
DEFAULT_SUBL_SETTINGS_USERFILE_UBU=

vars-setsubl(){
  output-todo 'sublime plugins/settings' # export SUBL_PLUGINS_PATH=$2
  case "$OS_TYPE" in
    mac) vars-setsubl-path $DEFAULT_SUBL_SETTINGS_PATH_MAC $DEFAULT_SUBL_SETTINGS_USERFILE_MAC;;
    ubu) vars-setsubl-ubu $DEFAULT_SUBL_SETTINGS_PATH_UBU $DEFAULT_SUBL_SETTINGS_USERFILE_UBU;;
  esac; }

vars-setsubl-path(){
  resolve-and-set 'SUBL_SETTINGS_PATH', $1
  resolve-and-set 'SUBL_SETTINGS_USERFILE', $1 }
  
link-subl(){ make-symlink $INSTALL_PATH/subl/$SUBL_SETTINGS_FILE $SUBL_SETTINGS_PATH/$SUBL_SETTINGS_FILE }
backup-subl(){ output-todo 'backup subl settings' }

