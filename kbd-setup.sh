#!/bin/bash

export DEFAULT_XMODMAP=.Xmodmap
export DEFAULT_MAC_KEY_REMAP_PATH=$INSTALL_HOME_PATH/Library/Preferences
export DEFAULT_MAC_KEY_REMAP_FILE=org.pqrs.KeyRemap4MacBook.plist
export DEFAULT_PC_KEY_REMAP_FILE=org.pqrs.PCKeyboardHack.plist

setup-kbd(){
  opts=(
    'vars-setkbd'
    'check-dependencies-kbd'
    'link-kbd-bindings-bash'
    'link-kbd-bindings-zsh'
    'link-kbd-bindings-vim'
    'link-kbd-bindings-emacs'
    'link-kbd-bindings-tmux'
    'link-xmodmap'
    'config-xmodmap'
    # 'backup-xmodmap'
    'check-for-key-remap'
    'link-key-remap'
    # 'backup-key-remap'
    'menu-setup'
    'menu-exit' )
  menu-for ${opts[@]};
  setup-kbd; }

check-dependencies-kbd(){
  case "$OS_TYPE" in
    mac) check-dependencies-kbd-mac;;
    ubu) check-dependencies-kbd-ubu;;
  esac; }
check-dependencies-kbd-mac(){ check-key-remap; }
check-dependencies-kbd-ubu(){ output-todo 'check-dependencies-kbd-ubu (none?)'; }
check-for-key-remap(){ vars-setkbd; check-for-dir "$MAC_KEY_REMAP_PATH" 'Both Mac & PC Key Remap Required:'; }

vars-setkbd(){
  case "$OS_TYPE" in
    mac) vars-setkbd-mac;;
    ubu) vars-setkbd-ubu;;
  esac; }
vars-setkbd-ubu(){ ask-for-input 'XMODMAP'; }
vars-setkbd-mac(){
  ask-for-input 'MAC_KEY_REMAP_PATH'
  ask-for-input 'MAC_KEY_REMAP_FILE'
  ask-for-input 'PC_KEY_REMAP_FILE'; }

link-xmodmap(){ make-symlink $INSTALL_PATH/kbd/$XMODMAP.$OS_TYPE $INSTALL_HOME_PATH/$XMODMAP; }
config-xmodmap(){ output-todo 'check if config necessary'; }

link-key-remap(){
  make-symlink $INSTALL_PATH/kbd/$MAC_KEY_REMAP_FILE $MAC_KEY_REMAP_PATH/$MAC_KEY_REMAP_FILE
  make-symlink $INSTALL_PATH/kbd/$PC_KEY_REMAP_FILE $MAC_KEY_REMAP_PATH/$PC_KEY_REMAP_FILE
  output-todo 'link key remap multitouch settings'; }

link-kbd-bindings-bash(){ link-kbd-bindings 'bash'; }
link-kbd-bindings-zsh(){ link-kbd-bindings 'zsh'; }
link-kbd-bindings-vim(){ link-kbd-bindings 'vim'; }
link-kbd-bindings-emacs(){ 
  make-symlink $INSTALL_PATH/kbd/bindkeys.emacs.$OS_TYPE $INSTALL_HOME_PATH/.emacs.d/personal/support/bindkeys.el;
  make-symlink $INSTALL_PATH/kbd/bindkeys.emacs.json $INSTALL_HOME_PATH/.emacs.d/personal/support/bindkeys.emacs.json; }

link-kbd-bindings-tmux(){ link-kbd-bindings 'tmux'; }

link-kbd-bindings(){
  mkdir-if-missing $INSTALL_HOME_PATH/.$1
  make-symlink $INSTALL_PATH/kbd/bindkeys.$1.$OS_TYPE $INSTALL_HOME_PATH/.$1/bindkeys; }

backup-xmodmap(){ output-todo 'backup xmodmap'; }
backup-key-remap(){ output-todo 'backup key remap'; }
