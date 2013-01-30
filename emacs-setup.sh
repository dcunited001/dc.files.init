#!/bin/bash

setup-emacs(){
  opts=(
    'link-prelude'
    'link-emacs'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-emacs; }

check-dependencies-emacs(){ check-if-installed emacs; }

link-emacs(){
  rm -rf $INSTALL_HOME_PATH/.emacs.d/personal;
  make-symlink $INSTALL_PATH/emacs/ $INSTALL_HOME_PATH/.emacs.d/personal; }

link-prelude(){ make-symlink $INSTALL_PATH/prelude/ $INSTALL_HOME_PATH/.emacs.d; }
