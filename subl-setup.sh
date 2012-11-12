#!/bin/bash

check-dependencies-subl()
{
  echo 'TODO: check-dependencies-subl'
}

vars-setsubl()
{
  case "$OS_TYPE" in
    mac)
      export SUBL_SETTINGS_PATH="$HOME_PATH/Library/Application Support/Sublime Text 2/Packages/User"
      export SUBL_SETTINGS_USER='Preferences.sublime-settings'
      ;;
    ubu)
      # TODO: Linux
      export SUBL_SETTINGS_PATH=
      export SUBL_SETTINGS_USER=
      ;;
  esac
  # TODO: sublime plugins/settings
  #export SUBL_PLUGINS_PATH=$2
}

link-subl()
{
  make-symlink $INSTALL_PATH/subl/$SUBL_SETTINGS_FILE $SUBL_SETTINGS_PATH/$SUBL_SETTINGS_FILE
}

backup-subl()
{
  echo 'TODO: backup subl settings'
}

