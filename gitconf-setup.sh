#!/bin/bash

export DEFAULT_GIT_IGNORE=.gitignore_global
export DEFAULT_GIT_CONFIG=.gitconfig

check-dependencies-gitconf()
{
  case "$OS_TYPE" in
    mac)
      check-if-installed brew
      ;;
    ubu)
      #check sudo?
      check-if-installed apt-get
      ;;
  esac

  check-if-installed git
}

vars-setgitconf()
{ # set name,email,ignorefile,config,token
  #git-setup.sh
  export GIT_NAME=$1
  export GIT_EMAIL=$2
  export GIT_IGNORE=$3
  export GIT_CONFIG=$4
  export GIT_TOKEN=$5
}

link-gitignore()
{
  make-symlink $INSTALL_PATH/gitconf/$GIT_IGNORE.$OS_TYPE $HOME_PATH/$GIT_IGNORE
}

create-gitconfig()
{
  #requires ruby
  echo 'TODO: create gitconfig template from ERB'
}

install-git()
{
  case "$OS_TYPE" in
    mac)
      install-git-mac
      ;;
    ubu)
      install-git-ubu
      ;;
  esac
}

install-git-mac()
{
  echo 'TODO: install-git-mac'
}

install-git-ubu()
{
  echo 'TODO: install-git-ubu'
}
