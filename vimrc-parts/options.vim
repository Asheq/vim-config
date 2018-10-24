" This file is organized like :options.

" Important {{{
set cpoptions-=a
set cpoptions-=A
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
set nowrap
let &listchars=g:symbols_listchars
let &showbreak=g:symbols_showbreak
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
let &statusline= ""
  \ . "%<%{vimrc#get_statusline_padding_left()}%L\ "
  \ . g:symbols_window_percentage . "%P "
  \ . "%1*%{vimrc#get_statusline_scrollbar()}%0* "
  \ . "%{vimrc#get_buffer_head_display_name()}"
  \ . "%2*%{vimrc#get_buffer_tail_display_name()}%0*\ "
set splitright
set splitbelow
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
set foldtext=vimrc#get_fold_text()
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
