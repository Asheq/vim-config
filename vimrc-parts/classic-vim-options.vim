if !has('nvim')
  " Options based on :h nvim-defaults
  syntax enable
  filetype plugin indent on

  set autoindent
  set autoread
  set backspace=indent,eol,start
  let &backupdir=vimrc#get_vim_backup_dir()
  set belloff=all
  set complete-=i
  set cscopeverbose
  let &directory=vimrc#get_vim_swap_dir()
  set display=lastline
  set encoding=utf-8
  set fillchars=vert:│,fold:·
  set nofsync
  set formatoptions=tcqj
  set history=10000
  set hlsearch
  set incsearch
  set langnoremap
  set nolangremap
  set laststatus=2
  set listchars=tab:>\ ,trail:-,nbsp:+
  set nocompatible
  set nrformats=bin,hex
  set ruler
  set sessionoptions-=options
  set showcmd
  set sidescroll=1
  set smarttab
  set tabpagemax=50
  set tags=./tags;,tags
  set ttyfast
  let &undodir=vimrc#get_vim_undo_dir()
  set viminfo^=!
  set wildmenu

  " Other vim-specific options
  set ttymouse=sgr

  " Terminal codes
  let &t_EI="\<Esc>[2 q"
  let &t_SI="\<Esc>[6 q"
  let &t_SR="\<Esc>[4 q"

  " Plugins
  packadd! matchit
endif
