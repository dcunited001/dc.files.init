#!/bin/bash

check-dependencies-vim(){ check-if-installed vim }
vars-setvim(){ output-todo 'set vim vars' }
setup-vim-plugins(){ output-todo 'setup-vim-plugins' }

link-vimrc-before()   { make-symlink $INSTALL_PATH/vim/.vimrc.before.$OS_TYPE $INSTALL_HOME_PATH/.vimrc.before }
link-vimrc-after()    { make-symlink $INSTALL_PATH/vim/.vimrc.after.$OS_TYPE $INSTALL_HOME_PATH/.vimrc.after }
link-gvimrc-before()  { make-symlink $INSTALL_PATH/vim/.gvim.before.$OS_TYPE $INSTALL_HOME_PATH/.gvim.before } 
link-gvimrc-after()   { make-symlink $INSTALL_PATH/vim/.gvim.after.$OS_TYPE $INSTALL_HOME_PATH/.gvim.after }

link-vim-colors()     { make-symlink $INSTALL_PATH/vim/colors/ $INSTALL_HOME_PATH/.vim/colors }
