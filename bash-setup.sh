#!/bin/bash

setup-bash(){
  opts=(
    'make-bash-dir'
    'link-bash-profile'
    'link-bash-aliases'
    'link-kbd-bindings-bash'
    'menu-setup'
    'menu-exit' )
  menu-for ${opts[@]}; 
  setup-bash; }

check-dependencies-bash(){ check-if-installed bash; }
vars-setbash(){ output-todo 'set bash vars'; }

#place all scripts in bash folder?
make-bash-dir(){ mkdir-if-missing $INSTALL_HOME_PATH/.bash; }
link-bash-profile(){ make-symlink $INSTALL_PATH/bash/bash_profile.$OS_TYPE $INSTALL_HOME_PATH/.bash_profile; }
link-bash-rc(){ make-symlink $INSTALL_PATH/bash/bashrc.$OS_TYPE $INSTALL_HOME_PATH/.bashrc; }
#link other bashfiles

