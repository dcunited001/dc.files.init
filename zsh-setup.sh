#!/bin/bash

check-dependencies-zsh()
{
  check-if-installed zsh
  # check-if-installed ruby #necessary?
}

vars-setzsh()
{
  echo 'TODO: set zsh vars'  
}

link-omz()
{
  make-symlink $INSTALL_PATH/omz $HOME_PATH/.oh-my-zsh
}

link-zshrc()
{
  mkdir-if-missing $HOME_PATH/.zsh
  make-symlink $INSTALL_PATH/zsh/.zshrc.$OS_TYPE $HOME_PATH/.zshrc
  make-symlink $INSTALL_PATH/zsh/zsh/.aliases.$OS_TYPE $HOME_PATH/.zsh/.aliases
  make-symlink $INSTALL_PATH/zsh/zsh/.omz $HOME_PATH/.zsh/.omz
}

install-zsh()
{ 
  # brew/apt-get?
  echo 'TODO: install zsh'
}
