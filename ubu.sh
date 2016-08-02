#!/bin/bash
source init/support.sh

vars-setinit-defaults-ubu
vars-setinit-dc-ubu
source-all-scripts

output-info
check-dependencies-init

menu-main
