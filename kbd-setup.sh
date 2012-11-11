#!/bin/bash

dcdotfiles-vars-setkbd()
{
  export XMODMAP=$1
}

dcdotfiles-setup-kbd-mac()
{
  echo 'TODO: Check for Keyboard Remap'
  echo 'TODO: finish mac keyboard setup'
}

dcdotfiles-setup-kbd-ubu()
{
  dcdotfiles-link-xmodmap
  echo 'TODO: finish ubuntu keyboard setup'
}

dcdotfiles-link-xmodmap()
{
  dcdotfiles-make-symlink $INSTALL_PATH/kbd/$XMODMAP.$OS_TYPE $HOME_PATH/$XMODMAP
}

