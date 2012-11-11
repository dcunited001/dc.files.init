#!/bin/bash

dcdotfiles-vars-ryanb()
{
  export RYANB_PATH=ryanb
  export RYANB_REPO=https://github.com/ryanb/dotfiles
}

dcdotfiles-link-gemrc()
{
  dcdotfiles-make-symlink $INSTALL_PATH/$RYANB_PATH/gemrc $HOME_PATH/.gemrc
}

dcdotfiles-link-irbrc()
{
  dcdotfiles-make-symlink $INSTALL_PATH/$RYANB_PATH/irbrc $HOME_PATH/.irbrc
}
