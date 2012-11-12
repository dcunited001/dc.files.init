#!/bin/bash
check-dependencies-secure()
{
  echo 'TODO: check-dependencies-secure?'
}

vars-setsecurepath()
{ #set vars for the secure files location
  export SEC_PATH=$1
}

create-securepath()
{
  mkdir $HOME_PATH/$SEC_PATH
}


