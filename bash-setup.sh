#!/bin/bash

setup-bash(){ 
  opts=(
    'link-kbd-bindings-bash'
    'menu-setup' )
  menu-for ${opts[@]}; 
  setup-bash; }

check-dependencies-bash(){ check-if-installed bash; }
vars-setbash(){ output-todo 'set bash vars'; }