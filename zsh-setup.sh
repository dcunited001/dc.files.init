#!/bin/bash

setup-zsh(){
  check-dependencies-zsh
  opts=(
    # 'vars-setzsh'
    'link-omz'
    'link-zshrc'
    'link-kbd-bindings-zsh'
    'menu-setup' 
    'menu-exit' )
  menu-for ${opts[@]};
  setup-zsh; }

# check-if-installed ruby #necessary?
check-dependencies-zsh(){ check-if-installed zsh; }
vars-setzsh(){ output-todo 'set zsh vars'; }
link-omz(){ make-symlink $INSTALL_PATH/omz $INSTALL_HOME_PATH/.oh-my-zsh; }
link-zshrc(){
  mkdir-if-missing $INSTALL_HOME_PATH/.zsh
  make-symlink $INSTALL_PATH/zsh/.zshrc.$OS_TYPE $INSTALL_HOME_PATH/.zshrc
  make-symlink $INSTALL_PATH/zsh/.aliases.$OS_TYPE $INSTALL_HOME_PATH/.zsh/.aliases
  make-symlink $INSTALL_PATH/zsh/.omz $INSTALL_HOME_PATH/.zsh/.omz; }
