#!/bin/bash

dcdotfiles-make-symlink()
{
  echo "    Linking $2"
  echo "      => $1"
  ln -s $1 $2
}

# ==============
# setup helpers
# ==============

dcdotfiles-setup-secure()
{
  source $INSTALL_PATH/init/secure-setup.sh
  dcdotfiles-vars-setsecurepath $DEFAULT_SEC_PATH
}

dcdotfiles-setup-gitconf()
{
  # fetch git token
  export GIT_TOKEN_SECURE=

  source $INSTALL_PATH/init/gitconf-setup.sh
  dcdotfiles-vars-setgitconf $NAME $EMAIL $DEFAULT_GIT_IGNORE $DEFAULT_GIT_CONFIG $GIT_TOKEN_SECURE
  dcdotfiles-create-gitignore-link
}

dcdotfiles-setup-iterm()
{
  source $INSTALL_PATH/init/iterm-setup.sh
  echo 'TODO: setup iterm'
}

dcdotfiles-setup-kbd()
{
  source $INSTALL_PATH/init/kbd-setup.sh
  echo 'TODO: setup kbd'
}

dcdotfiles-setup-tmux()
{
  source $INSTALL_PATH/init/tmux-setup.sh
  echo 'TODO: setup tmux'
}


