#!/bin/bash

#any dependencies?
check-dependencies-ryanb(){ echo 'TODO: check-dependencies-ryanb' }

vars-ryanb(){
  export RYANB_PATH=ryanb
  export RYANB_REPO=https://github.com/ryanb/dotfiles
} 
link-gemrc(){ make-symlink $INSTALL_PATH/$RYANB_PATH/gemrc $HOME_PATH/.gemrc }
link-irbrc(){ make-symlink $INSTALL_PATH/$RYANB_PATH/irbrc $HOME_PATH/.irbrc }
