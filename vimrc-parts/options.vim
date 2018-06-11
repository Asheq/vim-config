" This file is organized like :options.

" Vim {{{
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

  " Set other options that vim needs.
  let &t_EI="\<Esc>[2 q"
  let &t_SI="\<Esc>[6 q"
  let &t_SR="\<Esc>[4 q"
  set encoding=utf-8
  set ttymouse=sgr
endif
" }}}

" GUI {{{
if has('gui_macvim')
  set guifont=Fantasque_Sans_Mono:h17
endif
" }}}

" Moving Around, Searching and Patterns {{{
set path=.,,**
set nostartofline
set ignorecase
set smartcase
if exists("&inccommand")
  set inccommand=nosplit " TODO: Report flickering with syntax enabled.
endif
" }}}

" Displaying Text {{{
set cmdheight=2
set number
set numberwidth=1
set linebreak
set breakindent
set nowrap
set list
if has('multi_byte')
  let &listchars='tab:▸ ,trail:‿,extends:▐,precedes:▌,nbsp:○'
  let &showbreak='→→→'
  let &fillchars='vert:│,fold:-'
else
  let &listchars='tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let &showbreak='+++'
endif
" }}}

" Syntax, Highlighting and Spelling {{{
set cursorline
set termguicolors

if strftime("%H") < 14
  set background=light
else
  set background=dark
endif
" }}}

" Multiple Windows {{{
set hidden
set noruler
let &statusline='  %L %<%f %h%w%m%r'
" }}}

" Using the Mouse {{{
set mouse=a
set mousehide
" }}}

" Messages and Info {{{
set noshowcmd
set noshowmode
set shortmess=
set shortmess+=F
set shortmess+=c
set confirm
" }}}

" Editing Text {{{
set dictionary+=/usr/share/dict/words
set textwidth=100
set formatoptions-=c
set nojoinspaces
set infercase
set undofile
set pumheight=15
set completeopt+=menuone
set completeopt+=noselect
" }}}

" Folding {{{
set nofoldenable
set foldcolumn=2
" }}}

" Mapping {{{
set ttimeoutlen=10
" }}}

" Reading and Writing Files {{{
set modelines=1
" }}}

" Command Line Editing {{{
set fileignorecase
set wildcharm=<C-z>
set wildignore+=.DS_Store
set wildmode=list:longest,full
set cmdwinheight=18
" }}}

" Various {{{
set virtualedit=block
" }}}


if has('nvim') && executable('nvr')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

" vim: fdm=marker
