#!/bin/bash

check-dependencies-janus()
{
  check-if-installed vim
  echo 'TODO: janus dependencies'
}

vars-janus()
{
  export JANUS_PATH=janus/janus
  export JANUS_REPO=https://github.com/carlhuda/janus
}
