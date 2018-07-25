" This file is organized like :options.

" Important {{{
" set cpoptions-=_ " TODO
" }}}

" Moving Around, Searching and Patterns {{{
set nostartofline
set ignorecase
set smartcase
if exists("&inccommand")
  set inccommand=nosplit
endif
" }}}

" Displaying Text {{{
set cmdheight=2
set number
set numberwidth=1
set linebreak
set breakindent
set list
if has('multi_byte')
  let &listchars='tab:▻ ,trail:○,extends:▐,precedes:▌,nbsp:◡'
  let &showbreak='↪ '
  let &fillchars='vert: ,fold:-'
else
  let &listchars='tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let &showbreak='+++'
endif
" }}}

" Syntax, Highlighting and Spelling {{{
set cursorline
set termguicolors
" }}}

" Multiple Windows {{{
set hidden
set noruler
set winminheight=0
set winminwidth=0
set statusline=%{vimrc#get_statusline_padding_left()}%L\ \{%P\}\ %<%{vimrc#get_buffer_display_name()}\ %h%w%m%r%{vimrc#get_maximized_flag()}
" }}}

" Using the Mouse {{{
set mouse=nvi
set mousehide
" }}}

" Messages and Info {{{
set shortmess=
set shortmess+=F
set shortmess+=c
set shortmess+=I
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
set sessionoptions+=localoptions
" }}}

" GUI {{{
if has('gui_macvim')
  set guifont=Fantasque_Sans_Mono:h17
endif
" }}}

" vim: fdm=marker
