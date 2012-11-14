#!/bin/bash

setup-emacs(){
  opts=(
    # 'vars-setiterm'
    # 'check-dependencies-iterm'
    # 'link-iterm'
    # 'backup-iterm'
    'link-kbd-bindings-emacs'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-emacs }