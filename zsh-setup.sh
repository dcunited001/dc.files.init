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
  mkdir-if-missing $INSTALL_HOME_PATH/.zsh/.etc
  make-symlink $INSTALL_PATH/zsh/zshenv.$OS_TYPE $INSTALL_HOME_PATH/.zsh/.zshenv
  make-symlink $INSTALL_PATH/zsh/zprofile.$OS_TYPE $INSTALL_HOME_PATH/.zsh/.zprofile
  make-symlink $INSTALL_PATH/zsh/zshrc.$OS_TYPE $INSTALL_HOME_PATH/.zsh/.zshrc
  make-symlink $INSTALL_PATH/zsh/zlogin.$OS_TYPE $INSTALL_HOME_PATH/.zsh/.zlogin
  make-symlink $INSTALL_PATH/zsh/zlogout.$OS_TYPE $INSTALL_HOME_PATH/.zsh/.zlogout
  make-symlink $INSTALL_PATH/alias/alias.$OS_TYPE $INSTALL_HOME_PATH/.zsh/alias
  make-symlink $INSTALL_PATH/zsh/omz $INSTALL_HOME_PATH/.zsh/omz; }

link-zsh-profile-etc(){ output todo 'create /etc/zsh* links (or copy the files?)'; }
backup-zsh-profile-etc() { output todo 'cp /etc/zsh* files'; }
