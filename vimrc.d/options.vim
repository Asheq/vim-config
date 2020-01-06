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
set background=dark
set colorcolumn+=+1
" }}}

" Multiple Windows {{{
set hidden
set noruler
set winminheight=0
set winminwidth=0
set splitright
set splitbelow
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
set shortmess+=I
set confirm
set noshowmode
" }}}

" Selecting text {{{
set clipboard=unnamedplus
" }}}

" Editing Text {{{
set dictionary+=/usr/share/dict/words
set textwidth=80
let g:default_formatoptions  = 'tcl' " Auto wrap while typing
let g:default_formatoptions .= 'rojq' " Auto insert/delete comment leader
let g:default_formatoptions .= 'n' " Recognize numbered lists
" NOTE: I've decided that the following should not be included in default
" formatoptions: w2vbmMB1p. 1 and p could be useful but only when writing prose.
let &formatoptions=g:default_formatoptions
set nojoinspaces
set infercase
set undofile
set pumheight=15
set completefunc=CompleteMonths
set completeopt+=menuone
set completeopt+=noselect
set complete-=t
set thesaurus+=~/.thesaurus/words
" }}}

" Folding {{{
set nofoldenable
set foldcolumn=2
set foldtext=vimrc#get_fold_text()
set foldmethod=syntax
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

" Various {{{
set virtualedit=block
set sessionoptions+=localoptions
augroup stdin_options
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end
" }}}

" Tabs and indenting {{{
set expandtab
set tabstop=2
set shiftwidth=0
" }}}

" The swap file {{{
set updatetime=300
" }}}

" GUI (Firenvim) {{{
function! OnUIEnter(event)
  let l:ui = nvim_get_chan_info(a:event.chan)
  if has_key(l:ui, 'client') && has_key(l:ui.client, 'name')
    if l:ui.client.name ==# 'Firenvim'
      set guifont=Monaco:h12
    endif
  endif
endfunction

if has('nvim')
  autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
endif
" }}}
" vim: fdm=marker
