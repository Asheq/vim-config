" This file is organized like :options.

" 1. Important {{{
set cpo+=J
" }}}

" 2. Moving around, searching and patterns {{{
set nowrapscan
if exists("&inccommand")
  set inccommand=split
endif
" }}}

" 4. Displaying text {{{
set number
set breakindent
set list
set cmdheight=2
set listchars=tab:·\ ,trail:￮,extends:▶,precedes:◀,nbsp:+
set showbreak=+++
" }}}

" 5. Syntax, highlighting and spelling {{{
set nohlsearch
set cursorline
set termguicolors
set background=dark
" }}}

" 6. Multiple windows {{{
" TODO Make statusline closer to the original (keep [No Name] etc.)
" TODO Simplify calls to functions
let &statusline= ""
  \ . "%<%{vimrc#get_buffer_head()}"
  \ . "%1*%{vimrc#get_buffer_tail()}%0*"
  \ . "%{vimrc#buffer_name_shown()?' ':''}"
  \ . "%=%P"
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
augroup end
" }}}

" 7. Multiple tab pages {{{
set showtabline=2
" }}}

" 9. Using the mouse {{{
set mouse=a
" }}}

" 11. Messages and info {{{
set confirm
set noruler
" }}}

" 13. Editing text {{{
" NOTE I've decided that, in general, the following should not be included in
" formatoptions: w2vbmMB1p. 1 and p could be useful but only when writing
" prose.
set formatoptions+=nl

" NOTE: Mandatory settings for mucomplete
set completeopt+=menuone
set completeopt+=noselect

set undofile
" }}}

" 15. Folding {{{
" BOOKMARK
set foldcolumn=2
set foldtext=vimrc#get_fold_text()
" }}}

" 16. Diff mode {{{
set diffopt+=vertical
" }}}

" 17. Mapping {{{
set timeoutlen=10000
" }}}

" 18. Reading and writing files {{{
set modelines=1
" }}}

" 19. The swap file {{{
set updatetime=300
" }}}

" 20. Command line editing {{{
set fileignorecase
set wildcharm=<C-z>
set cmdwinheight=18
" }}}

" 22. Running make and jumping to errors {{{
let &grepprg='rg --vimgrep --no-heading --smart-case'
let &grepformat='%f:%l:%c:%m,%f:%l:%m,%f:%l%m,%f  %l%m'
" }}}

" 25. Various {{{
set virtualedit=block
" }}}

" GUI options {{{
set guifont=Iosevka:h18
set guioptions-=e

if exists('g:started_by_firenvim')
  set guifont=Iosevka:h10
endif

if has("gui_macvim")
  set guifont=Iosevka:h18
  set guioptions-=e
endif
" }}}

" Terminal options {{{
if has('nvim')
  augroup terminal_options
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup end
endif
" }}}

" 'Standard in' options {{{
augroup stdin_options
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end
" }}}

" vim: fdm=marker
