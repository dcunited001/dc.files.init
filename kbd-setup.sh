#!/bin/bash

check-dependencies-kbd()
{
  case "$OS_TYPE" in
    mac)
      echo 'TODO: kbd dependencies mac'
      ;;
    ubu)
      echo 'TODO: kbd dependencies ubuntu'
      ;;
  esac
}

vars-setkbd()
{
  export XMODMAP=.Xmodmap
  export MAC_KEY_REMAP_PATH=$HOME_PATH/Library/Preferences
  export MAC_KEY_REMAP_FILE=org.pqrs.KeyRemap4MacBook.plist
  export PC_KEY_REMAP=
}

setup-kbd-mac()
{
  if [ -d "$MAC_KEY_REMAP_PATH" ]
  then
    make-symlink $INSTALL_PATH/kbd/$MAC_KEY_REMAP_FILE $MAC_KEY_REMAP_FILE
  else
    echo 'INSTALL KEY REMAP. aborting..'
    exit;
  fi
  echo 'TODO: finish mac keyboard setup'
}

setup-kbd-ubu()
{
  link-xmodmap
  echo 'TODO: finish ubuntu keyboard setup'
}

setup-bindings()
{
  
}

link-xmodmap()
{
  make-symlink $INSTALL_PATH/kbd/$XMODMAP.$OS_TYPE $HOME_PATH/$XMODMAP
}

setup-xmodmap()
{
  echo 'TODO: check if config necessary'
}

link-zsh-bindings()
{
  [[ ! -d "$HOME_PATH/.zsh" ]] && mkdir $HOME_PATH/.zsh
  make-symlink $INSTALL_PATH/kbd/.zsh.bindings.$OS_TYPE $HOME_PATH/.zsh/.bindings
}

link-bash-bindings()
{ 
  [[ ! -d "$HOME_PATH/.bash" ]] && mkdir $HOME_PATH/.bash
  make-symlink $INSTALL_PATH/kbd/.bash.bindings.$OS_TYPE $HOME_PATH/.bash/.bindings
}

link-vim-bindings()
{
  [[ ! -d "$HOME_PATH/.vim" ]] && mkdir $HOME_PATH/.vim
  make-symlink $INSTALL_PATH/kbd/.vim.bindings.$OS_TYPE $HOME_PATH/.vim/.bindings
  echo 'TODO: vim bindings'
}

link-emacs-bindings()
{
  echo 'TODO: emacs bindings'
}

backup-xmodmap()
{
  echo 'TODO: backup xmodmap'
}

backup-kb-remap()
{
  echo 'TODO: backup kb remap'
}

