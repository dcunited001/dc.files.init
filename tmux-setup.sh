#!/bin/bash

check-dependencies-tmux(){ check-if-installed tmux; check-if-installed tmuxinator; }
vars-settmux(){ output-todo 'set tmux vars' }
link-tmux-conf(){ make-symlink $INSTALL_PATH/tmux/.tmux.conf.$OS_TYPE $HOME_PATH/.tmux.conf }