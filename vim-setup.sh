#!/bin/bash

#path to janus from ~/.files
DEFAULT_JANUS_PATH=janus/janus

setup-vim(){
  check-dependencies-vim
  opts=(
    'check-dependencies-janus'
    'vars-setjanus'
    'link-janus-all'
    'make-janus-plugin-folder'
    'exec-janus-rake'
    'link-vimrc-all'
    'link-janus-vimrc'
    'link-janus-gvimrc'
    'link-gvimrc-all'
    'link-vim-colors'
    'link-vim-syntax'
    'link-kbd-bindings-vim'
    'setup-vim-plugins'
    'menu-setup'
    'menu-exit' );
  menu-for ${opts[@]};
  setup-vim; }

check-dependencies-vim(){ check-if-installed vim; }
check-dependencies-janus(){ check-if-installed vim ruby rake; }

vars-setvim(){ output-todo 'set vim vars'; }
vars-setjanus(){ ask-for-input 'JANUS_PATH'; }

setup-vim-plugins(){ output-todo 'decide on using vim or janus plugin folder'; output-todo 'setup-vim-plugins'; }

link-vimrc-before()   { make-symlink $INSTALL_PATH/vim/.vimrc.before.$OS_TYPE $INSTALL_HOME_PATH/.vimrc.before; }
link-vimrc-after()    { make-symlink $INSTALL_PATH/vim/.vimrc.after.$OS_TYPE $INSTALL_HOME_PATH/.vimrc.after; }
link-gvimrc-before()  { make-symlink $INSTALL_PATH/vim/.gvimrc.before.$OS_TYPE $INSTALL_HOME_PATH/.gvimrc.before; } 
link-gvimrc-after()   { make-symlink $INSTALL_PATH/vim/.gvimrc.after.$OS_TYPE $INSTALL_HOME_PATH/.gvimrc.after; }

link-vim-colors()     { make-symlink $INSTALL_PATH/vim/colors/ $INSTALL_HOME_PATH/.vim/colors; }
link-vim-syntax()     { make-symlink $INSTALL_PATH/vim/syntax/ $INSTALL_HOME_PATH/.vim/syntax; }

link-vimrc-all()      { link-vimrc-before; link-vimrc-after; }
link-gvimrc-all()     { link-gvimrc-before; link-gvimrc-after; }
link-janus-all() { 
  link-janus-folder; 
  # janus rake task care of vimrc & gvimrc
  link-janus-rakefile;
  remind-janus-rake; }

link-janus-vimrc()          { make-symlink $INSTALL_PATH/janus/janus/vim/vimrc $INSTALL_HOME_PATH/.vimrc; }
link-janus-gvimrc()         { make-symlink $INSTALL_PATH/janus/janus/vim/gvimrc $INSTALL_HOME_PATH/.gvimrc; }
link-janus-folder()         { make-symlink $INSTALL_PATH/janus/janus $INSTALL_HOME_PATH/.vim/janus; }
link-janus-rakefile()       { make-symlink $INSTALL_PATH/janus/Rakefile $INSTALL_HOME_PATH/.vim/Rakefile; }
make-janus-plugin-folder()  { mkdir-if-missing $INSTALL_HOME_PATH/.janus; output-todo 'decide on using vim or janus plugin folder'; }

exec-janus-rake(){ output-todo 'exec janus rake'; }
remind-janus-rake(){
  output-line
  echo 'Run janus rake task!'
  echo '  cd ~/.vim'
  echo '  rake'
  output-line; }
