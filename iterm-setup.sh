#!/bin/bash

export DEFAULT_ITERM_SETTINGS_PATH=$INSTALL_HOME_PATH/Library/Preferences
export DEFAULT_ITERM_SETTINGS_FILE=com.googlecode.iterm2.plist

check-dependencies-iterm(){ check-for-dir $ITERM_SETTINGS_PATH 'iTerm'; }
setup-iterm(){
  opts=(
    'check-dependencies-iterm'
    'vars-setiterm'
    'link-iterm'
    # 'backup-iterm'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-iterm; }  

vars-setiterm(){
  ask-for-input 'ITERM_SETTINGS_PATH'; 
  ask-for-input 'ITERM_SETTINGS_FILE'; }
link-iterm(){ make-symlink $INSTALL_PATH/iterm/$ITERM_SETTINGS_FILE $ITERM_SETTINGS_PATH/$ITERM_SETTINGS_FILE; }
backup-iterm(){ output-todo 'backup iterm settings'; }
setup-iterm-fonts(){ output-todo 'setup iterm fonts'; }