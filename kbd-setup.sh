#!/bin/bash

check-dependencies-kbd(){
  case "$OS_TYPE" in
    mac) output-todo 'kbd dependencies mac';;
    ubu) output-todo 'kbd dependencies ubuntu';;
  esac; }

vars-setkbd(){
  export XMODMAP=.Xmodmap
  export MAC_KEY_REMAP_PATH=$HOME_PATH/Library/Preferences
  export MAC_KEY_REMAP_FILE=org.pqrs.KeyRemap4MacBook.plist
  export PC_KEY_REMAP_FILE=org.pqrs.PCKeyboardHack.plist; }

setup-kbd-mac(){
  check-key-remap
  make-symlink $INSTALL_PATH/kbd/$MAC_KEY_REMAP_FILE $MAC_KEY_REMAP_FILE
  output-todo 'finish mac keyboard setup'; }

setup-kbd-ubu(){
  config-xmodmap
  link-xmodmap
  output-todo 'finish ubuntu keyboard setup'; }

check-key-remap(){
  check-for-dir "$MAC_KEY_REMAP_PATH/$MAC_KEY_REMAP_FILE" 'Both Mac & PC Key Remap Required:'
  check-for-dir "$MAC_KEY_REMAP_PATH/$PC_KEY_REMAP_FILE" 'Both Mac & PC Key Remap Required:' }

link-xmodmap(){ make-symlink $INSTALL_PATH/kbd/$XMODMAP.$OS_TYPE $HOME_PATH/$XMODMAP; }
config-xmodmap(){ output-todo 'check if config necessary'; }

link-kbd-bindings(){
  mkdir-if-missing $HOME_PATH/.$1
  make-symlink $INSTALL_PATH/kbd/.$1.bindings.$OS_TYPE $HOME_PATH/.$1/.bindings; }

backup-xmodmap(){ output-todo 'backup xmodmap'; }
backup-kb-remap(){ output-todo 'backup kb remap'; }

