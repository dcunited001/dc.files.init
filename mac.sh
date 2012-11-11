#!/bin/bash

#my info
export DC_NAME='David Conner'
export DC_GMAIL='dconner.pro@gmail.com'
export DC_GIT_USER='dcunited002'

#info
export NAME=$DC_NAME
export EMAIL=$DC_GMAIL
export GIT_USER=$DC_GIT_USER

#mac info
export MAC_USER_NAME=davidconner
export MAC_HOME_PATH=/Users/$MAC_USER_NAME
export MAC_OS_TYPE=mac

#set user name
export OS_TYPE=$MAC_OS_TYPE
export USER_NAME=$MAC_USER_NAME
export HOME_PATH=$MAC_HOME_PATH
export INSTALL_FOLDER=.files
export INSTALL_PATH=$HOME_PATH/$INSTALL_FOLDER

export DEFAULT_GIT_IGNORE=.gitignore_global
export DEFAULT_GIT_CONFIG=.gitconfig
export DEFAULT_SEC_PATH=.security

source $INSTALL_PATH/init/support.sh
