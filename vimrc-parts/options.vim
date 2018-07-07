" This file is organized like :options.

" GUI {{{
if has('gui_macvim')
  set guifont=Fantasque_Sans_Mono:h17
endif
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
  let &showbreak='↻ '
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
if has('nvim') && executable('nvr') " TODO: This doesn't work right now
  let $VISUAL = 'nvr -cc split --remote-wait'
endif
" }}}

" vim: fdm=marker
