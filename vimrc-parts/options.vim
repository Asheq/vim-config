" This file is organized like :options.

" Important {{{
set cpoptions-=aA
set cpoptions+=M
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
else
  let &listchars='tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let &showbreak='+++'
endif
let &fillchars='vert: ,fold: '
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
set statusline=%{vimrc#get_statusline_padding_left()}%L\ \{%P\}\ %<%{vimrc#get_buffer_display_name()}\ %h%w%m%r
" }}}

" Multiple Tab Pages {{{
set showtabline=2
" }}}

" Using the Mouse {{{
set mouse=nvi
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
set formatoptions-=t
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

" Diff Mode {{{
set diffopt+=vertical
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
