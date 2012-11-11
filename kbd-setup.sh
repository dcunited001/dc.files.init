#!/bin/bash
dcdotfiles-vars-setkbd()
{
  export XMODMAP=.Xmodmap
  export MAC_KEY_REMAP_PATH=$HOME_PATH/Library/Preferences
  export MAC_KEY_REMAP_FILE=org.pqrs.KeyRemap4MacBook.plist
  export PC_KEY_REMAP=
}

dcdotfiles-setup-kbd-mac()
{
  if [ -d "$MAC_KEY_REMAP_PATH" ]
  then
    dcdotfiles-make-symlink $INSTALL_PATH/kbd/$MAC_KEY_REMAP_FILE $MAC_KEY_REMAP_FILE
  else
    echo 'INSTALL KEY REMAP. aborting..'
    exit;
  fi
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

dcdotfiles-backup-xmodmap()
{
  echo 'TODO: backup xmodmap'
}

dcdotfiles-backup-kb-remap()
{
  echo 'TODO: backup kb remap'
}
