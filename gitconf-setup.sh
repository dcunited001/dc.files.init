#!/bin/bash

dcdotfiles-vars-setgitconf()
{ # set name,email,ignorefile,config,token
  #git-setup.sh
  export GIT_NAME=$1
  export GIT_EMAIL=$2
  export GIT_IGNORE=$3
  export GIT_CONFIG=$4
  export GIT_TOKEN=$5
}

dcdotfiles-create-gitignore-link()
{
  dcdotfiles-make-symlink $INSTALL_PATH/gitconf/$GIT_IGNORE.$OS_TYPE $HOME_PATH/$GIT_IGNORE
}

dcdotfiles-create-gitconfig()
{
  #requires ruby
  echo 'TODO: create gitconfig template from ERB'
}

dcdotfiles-install-git()
{
  case "$OS_TYPE" in
    mac)
      dcdotfiles-install-git-mac
      ;;
    ubu)
      dcdotfiles-install-git-ubu
      ;;
  esac
}

dcdotfiles-install-git-mac()
{
  echo 'TODO: install-git-mac'
}

dcdotfiles-install-git-ubu()
{
  echo 'TODO: install-git-ubu'
}
