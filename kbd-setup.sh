#!/bin/bash

check-dependencies-kbd()
{
  case "$OS_TYPE" in
    mac)
      echo 'TODO: kbd dependencies mac'
      ;;
    ubu)
      echo 'TODO: kbd dependencies ubuntu'
      ;;
  esac
}

vars-setkbd()
{
  export XMODMAP=.Xmodmap
  export MAC_KEY_REMAP_PATH=$HOME_PATH/Library/Preferences
  export MAC_KEY_REMAP_FILE=org.pqrs.KeyRemap4MacBook.plist
  export PC_KEY_REMAP_FILE=org.pqrs.PCKeyboardHack.plist
}

setup-kbd-mac()
{
  check-key-remap
  make-symlink $INSTALL_PATH/kbd/$MAC_KEY_REMAP_FILE $MAC_KEY_REMAP_FILE
  echo 'TODO: finish mac keyboard setup'
}

setup-kbd-ubu()
{
  config-xmodmap
  link-xmodmap
  echo 'TODO: finish ubuntu keyboard setup'
}

check-key-remap()
{
  [[ ! -d "$MAC_KEY_REMAP_PATH/$MAC_KEY_REMAP_FILE" ]] && { echo '    Both Mac & PC Key Remap Required:'; exit; }
  [[ ! -d "$MAC_KEY_REMAP_PATH/$PC_KEY_REMAP_FILE" ]] && { echo '    Both Mac & PC Remap Required:'; exit; }
}

link-xmodmap()
{
  make-symlink $INSTALL_PATH/kbd/$XMODMAP.$OS_TYPE $HOME_PATH/$XMODMAP
}

config-xmodmap()
{
  echo 'TODO: check if config necessary'
}

link-kbd-bindings()
{
  mkdir-if-missing $HOME_PATH/.$1
  make-symlink $INSTALL_PATH/kbd/.$1.bindings.$OS_TYPE $HOME_PATH/.$1/.bindings
}

backup-xmodmap()
{
  echo 'TODO: backup xmodmap'
}

backup-kb-remap()
{
  echo 'TODO: backup kb remap'
}

