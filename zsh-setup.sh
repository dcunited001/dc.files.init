#!/bin/bash

# check-if-installed ruby #necessary?
check-dependencies-zsh(){ check-if-installed zsh }

vars-setzsh(){ output-todo 'set zsh vars' }

link-omz(){ make-symlink $INSTALL_PATH/omz $HOME_PATH/.oh-my-zsh }

link-zshrc(){
  mkdir-if-missing $HOME_PATH/.zsh
  make-symlink $INSTALL_PATH/zsh/.zshrc.$OS_TYPE $HOME_PATH/.zshrc
  make-symlink $INSTALL_PATH/zsh/zsh/.aliases.$OS_TYPE $HOME_PATH/.zsh/.aliases
  make-symlink $INSTALL_PATH/zsh/zsh/.omz $HOME_PATH/.zsh/.omz
}

# brew/apt-get?
install-zsh(){ output-todo 'install zsh' }
