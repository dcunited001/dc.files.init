#!/bin/bash

setup-emacs(){
  opts=(
    # 'vars-setiterm'
    # 'check-dependencies-iterm'
    # 'link-iterm'
    # 'backup-iterm'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-emacs }