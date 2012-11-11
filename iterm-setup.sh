#!/bin/bash

dcdotfiles-vars-setiterm()
{
  export $ITERM_SETTINGS_PATH=$HOME_PATH/Library/Preferences
  export $ITERM_SETTINGS_FILE=com.googlecode.iterm2.plist
}

dcdotfiles-link-iterm()
{
  dcdotfiles-make-symlink $INSTALL_PATH/iterm/$ITERM_SETTINGS_FILE $ITERM_SETTINGS_PATH/$ITERM_SETTINGS_FILE
}

dcdotfiles-backup-iterm()
{
  echo 'TODO: backup iterm settings'
}

