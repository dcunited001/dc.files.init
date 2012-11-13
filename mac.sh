#!/bin/bash
source init/support.sh

vars-setinit-defaults-mac #sets default values
vars-setinit-dc-mac #automates, for now

output-info
check-dependencies-init

menu-main