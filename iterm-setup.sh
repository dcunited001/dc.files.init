#!/bin/bash

check-dependencies-iterm(){ output-todo 'check for iterm'; }

vars-setiterm(){
  export $ITERM_SETTINGS_PATH=$INSTALL_HOME_PATH/Library/Preferences
  export $ITERM_SETTINGS_FILE=com.googlecode.iterm2.plist; }

link-iterm(){ make-symlink $INSTALL_PATH/iterm/$ITERM_SETTINGS_FILE $ITERM_SETTINGS_PATH/$ITERM_SETTINGS_FILE; }
backup-iterm(){ output-todo 'backup iterm settings'; }