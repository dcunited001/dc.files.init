#!/bin/bash

dcdotfiles-vars-setzsh()
{
  echo 'TODO: set zsh vars'  
}

dcdotfiles-link-omz()
{
  dcdotfiles-make-symlink $INSTALL_PATH/omz $HOME_PATH/.oh-my-zsh
}

dcdotfiles-link-zshrc()
{
  [[ ! -d "$HOME_PATH/.zsh" ]] && mkdir $HOME_PATH/.zsh
  dcdotfiles-make-symlink $INSTALL_PATH/zsh/.zshrc.$OS_TYPE $HOME_PATH/.zshrc
  dcdotfiles-make-symlink $INSTALL_PATH/zsh/zsh/.aliases.$OS_TYPE $HOME_PATH/.zsh/.aliases
  dcdotfiles-make-symlink $INSTALL_PATH/zsh/zsh/.bindings.$OS_TYPE $HOME_PATH/.zsh/.bindings
  dcdotfiles-make-symlink $INSTALL_PATH/zsh/zsh/.omz $HOME_PATH/.zsh/.omz
}


