#!/bin/bash

check-dependencies-janus(){
  check-if-installed vim
  check-if-installed ruby
  check-if-installed rake
}

vars-janus(){
  export JANUS_PATH=janus/janus
  export JANUS_REPO=https://github.com/carlhuda/janus
}

link-janus-folder()         { make-symlink $INSTALL_PATH/janus/Rakefile $HOME_PATH/.vim/Rakefile }
link-janus-rakefile()       { make-symlink $INSTALL_PATH/janus/janus $HOME_PATH/.vim/janus }
make-janus-plugin-folder()  { mkdir-if-missing $HOME_PATH/.janus }

exec-janus-rake(){ echo 'TODO: exec janus rake' }