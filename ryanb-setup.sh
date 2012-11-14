#!/bin/bash


setup-ryanb(){
  opts=(
    'link-gemrc'
    'link-irbrc'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-ryanb; }

#any dependencies?
check-dependencies-ryanb(){ output-todo 'check-dependencies-ryanb'; }
link-gemrc(){ make-symlink $INSTALL_PATH/ryanb/gemrc $INSTALL_HOME_PATH/.gemrc; }
link-irbrc(){ make-symlink $INSTALL_PATH/ryanb/irbrc $INSTALL_HOME_PATH/.irbrc; }
