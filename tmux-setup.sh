#!/bin/bash

setup-tmux(){
  opts=(
    'check-dependencies-tmux'
    # 'vars-settmux'
    'link-tmux-conf'
    'link-kbd-bindings-tmux'
    'setup-tmuxinator-profiles'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-tmux; }

check-dependencies-tmux(){ check-if-installed tmux tmuxinator; }
link-tmux-conf(){ make-symlink $INSTALL_PATH/tmux/tmux.conf.$OS_TYPE $INSTALL_HOME_PATH/.tmux.conf; }

vars-settmux(){ output-todo 'set tmux vars'; }
setup-tmuxinator-profiles() { output-todo 'setup tmuxinator profiles'; }

