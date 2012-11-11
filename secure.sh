#!/bin/bash

dcdotfiles-vars-setsecurepath()
{ #set vars for the secure files location
  export SEC_PATH=$1
}

dcdotfiles-create-securepath()
{
  mkdir $HOME_PATH/$SEC_PATH
}


