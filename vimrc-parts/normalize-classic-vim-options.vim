if !has('nvim')
  " Make classic vim options equivalent to neovim defaults (see :h nvim-defaults).
  set autoindent
  set autoread
  set backspace=indent,eol,start
  let &backupdir=vimrc#get_vim_backup_dir()
  set belloff=all
  set complete-=i
  let &directory=vimrc#get_vim_swap_dir()
  set display=lastline
  set formatoptions=tcqj
  set history=1000
  set hlsearch
  set incsearch
  set langnoremap
  set nolangremap
  set laststatus=2
  let &listchars="tab:> ,trail:-,nbsp:+"
  set nocompatible
  set nrformats="bin,hex"
  set ruler
  set sessionoptions-=options
  set showcmd
  set smarttab
  set tabpagemax=50
  set tags=./tags;,tags
  set ttyfast
  let &undodir=vimrc#get_vim_undo_dir()
  set viminfo^=!
  set wildmenu

  " Set other options that classic vim needs.
  let &t_EI="\<Esc>[2 q"
  let &t_SI="\<Esc>[6 q"
  let &t_SR="\<Esc>[4 q"
  set encoding=utf-8
  set ttymouse=sgr
endif
