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
let &listchars=g:symbols.listchars
let &showbreak=g:symbols.showbreak
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
set winminheight=0
set winminwidth=0
let &statusline= ""
  \ . "%{vimrc#get_statusline_padding_left()}%L\ "
  \ . "%4*%{vimrc#get_statusline_scrollbar()}%0*"
  \ . "%{vimrc#show_scrollbar()?' ':''}"
  \ . "%<%{vimrc#get_buffer_head()}"
  \ . "%1*%{vimrc#get_buffer_tail()}%0*"
  \ . "%{vimrc#buffer_name_shown()?' ':''}"
augroup statusline_flags
    autocmd!
    autocmd User Flags call Hoist("buffer", "%h")
    autocmd User Flags call Hoist("buffer", "%w")
    autocmd User Flags call Hoist("buffer", "%m")
    autocmd User Flags call Hoist("buffer", "%r")
    " autocmd User Flags call Hoist("buffer", "vimrc#get_buffer_filetype_flag")
    " autocmd User Flags call Hoist("buffer", "vimrc#get_git_branch_flag")

    autocmd User Flags call Hoist("window", "%{&scrollbind?'[' . g:symbols.scrollbind . ']':''}")
    autocmd User Flags call Hoist("window", "%{&wrap?'[' . g:symbols.wrap . ']':''}")
    autocmd User Flags call Hoist("window", "%{&spell?'[' . g:symbols.spell . ']':''}")
    autocmd User Flags call Hoist("window", "%{&list?'[' . g:symbols.list . ']':''}")
    autocmd User Flags call Hoist("window", ""
          \ . "%{vimrc#get_window_cwd() != '' ?'[' . g:symbols.directory . ' ' : ''}"
          \ . "%{vimrc#get_window_cwd_head()}"
          \ . "%2*%{vimrc#get_window_cwd_tail()}%0*"
          \ . "%{vimrc#get_window_cwd() != '' ?']' : ''}")
augroup end
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
augroup stdin_options
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end
" }}}

" GUI {{{
if has('gui_macvim')
  set guifont=Fantasque_Sans_Mono:h17
endif
" }}}

" vim: fdm=marker
