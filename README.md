## Installation

### Unix-like Systems (macOS, Linux, Unix)

1. Clone this repository into `~/.vim`

     `git clone https://github.com/Asheq/vim-config.git ~/.vim`

1. Modify your existing `~/.vimrc` (or create one) to point to the vimrc inside your newly-cloned repository:

     `echo 'source $HOME/.vim/vimrc' > ~/.vimrc`

1. Open vim and run the following command to install plugins:

     `:PlugInstall`

1. Restart vim

### Windows

1. Clone this repository into `~\vimfiles`:

     `git clone https://github.com/Asheq/vim-config.git %homedrive%%homepath%\vimfiles`

1. Modify your existing `~\_vimrc` (or create one) to point to the vimrc inside your newly-cloned respository:

     `echo source $HOME\vimfiles\vimrc>_vimrc`

1. Open vim and run the following command to install plugins:

     `:PlugInstall`

1. Restart vim
