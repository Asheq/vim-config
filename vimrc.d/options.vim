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
  set inccommand=split
endif
" }}}

" Displaying Text {{{
set number
set numberwidth=1
set linebreak
set breakindent
set list
set display-=msgsep
set cmdheight=2
let &listchars='tab:» ,trail:·,extends:▶,precedes:◀,nbsp:○'
let &showbreak='┃'
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
set background=dark
" }}}

" Multiple Windows {{{
set hidden
set noruler
let &statusline= ""
  \ . "%{vimrc#get_total_lines_in_buffer()}"
  \ . "%{vimrc#get_buffer_tail() == '' ? '' : vimrc#get_glyph('file') . ' '}"
  \ . "%<%{vimrc#get_buffer_head()}"
  \ . "%1*%{vimrc#get_buffer_tail()}%0*"
  \ . "%{vimrc#buffer_name_shown()?' ':''}"
augroup statusline_flags
    autocmd!
    autocmd User Flags call Hoist("buffer", "%h")
    autocmd User Flags call Hoist("buffer", "%w")
    autocmd User Flags call Hoist("buffer", "%m")
    autocmd User Flags call Hoist("buffer", "%r")
    autocmd User Flags call Hoist("window", ""
          \ . "%{vimrc#get_window_cwd() == '' ? '' : '   ' . vimrc#get_glyph('directory') . ' '}"
          \ . "%{vimrc#get_window_cwd_head()}"
          \ . "%{vimrc#get_window_cwd_tail()}")
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
set confirm
" }}}

" Selecting text {{{
set clipboard=unnamedplus
" }}}

" Editing Text {{{
set dictionary+=/usr/share/dict/words
let g:default_formatoptions  = 'tcl' " Auto wrap while typing
let g:default_formatoptions .= 'rojq' " Auto insert/delete comment leader
let g:default_formatoptions .= 'n' " Recognize numbered lists
" NOTE: I've decided that the following should not be included in default
" formatoptions: w2vbmMB1p. 1 and p could be useful but only when writing prose.
let &formatoptions=g:default_formatoptions
set nojoinspaces
set infercase
set undofile
set completefunc=CompleteMonths
set completeopt+=menuone
set completeopt+=noselect
set complete-=t
set thesaurus+=~/.thesaurus/words
" }}}

" Folding {{{
set foldcolumn=2
set foldmethod=syntax
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
set cmdwinheight=18
" }}}

" Running make and jumping to errors {{{
let &grepprg='rg --vimgrep --no-heading --smart-case'
let &grepformat='%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f  %l%m'
" }}}

" Various {{{
set virtualedit=block
augroup stdin_options
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end
" }}}

" The swap file {{{
set updatetime=300
" }}}

" GUIs {{{
if exists('g:started_by_firenvim')
  set guifont=Iosevka:h10
  " let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI"]
  " let g:mucomplete#enable_auto_at_startup = 0
endif

if has("gui_macvim")
  set guifont=Iosevka:h18
endif
" }}}

" vim: fdm=marker
