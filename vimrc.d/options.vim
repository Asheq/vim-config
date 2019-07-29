" This file is organized like :options.

" Important {{{
set cpoptions-=a
set cpoptions-=A
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
set number
set numberwidth=1
set linebreak
set breakindent
set list
set display-=msgsep
let &listchars=vimrc#get_glyph('listchars')
let &showbreak=vimrc#get_glyph('showbreak')
let &fillchars='vert: ,fold: '
if has('nvim')
  augroup terminal_options
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup end
endif
" }}}

" Syntax, Highlighting and Spelling {{{
set cursorline
set termguicolors
" }}}

" Multiple Windows {{{
set hidden
set noruler
set noequalalways
set winminheight=0
set winminwidth=0
set splitright
set splitbelow
let &statusline= ""
  \ . "%{vimrc#get_statusline_padding_left()}%L "
  \ . "%<%{vimrc#get_buffer_head()}"
  \ . "%1*%{vimrc#get_buffer_tail()}%0*"
  \ . "%{vimrc#buffer_name_shown()?' ':''}"
augroup statusline_flags
    autocmd!
    autocmd User Flags call Hoist("buffer", "%h")
    autocmd User Flags call Hoist("buffer", "%w")
    autocmd User Flags call Hoist("buffer", "%m")
    autocmd User Flags call Hoist("buffer", "%r")
    autocmd User Flags call Hoist("window", "%{vimrc#get_window_flags()}")
    autocmd User Flags call Hoist("window", ""
          \ . "%{vimrc#get_window_cwd() == '' ? '' : '   ' . vimrc#get_glyph('directory') . ' '}"
          \ . "%{vimrc#get_window_cwd_head()}"
          \ . "%1*%{vimrc#get_window_cwd_tail()}%0*")
    autocmd User Flags call Hoist("window", "%{' '}")
augroup end
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
set noshowmode
" }}}

" Editing Text {{{
set dictionary+=/usr/share/dict/words
set textwidth=100
set formatoptions+=l
set nojoinspaces
set infercase
set undofile
set pumheight=15
set completeopt+=menuone
set completeopt+=noselect
set complete-=t
set thesaurus+=~/.thesaurus/words
set nrformats+=alpha
" }}}

" Folding {{{
set nofoldenable
set foldcolumn=2
set foldtext=vimrc#get_fold_text()
" }}}

" Diff Mode {{{
set diffopt+=vertical
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
augroup stdin_options
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end
" }}}

" vim: fdm=marker
