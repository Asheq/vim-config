" The options here are grouped and organized like :options.

" 1. Important
" ----------------------------------------------------------------------------
set cpo+=J

" 2. Moving around, searching and patterns
" ----------------------------------------------------------------------------
set nowrapscan
if exists("&inccommand")
  set inccommand=split
endif

" 4. Displaying text
" ----------------------------------------------------------------------------
set number
set breakindent
set list
set cmdheight=2
set listchars=tab:·\ ,trail:￮,extends:▶,precedes:◀,nbsp:+
set showbreak=+++

" 5. Syntax, highlighting and spelling
" ----------------------------------------------------------------------------
set nohlsearch
set cursorline
set termguicolors

" 6. Multiple windows
" ----------------------------------------------------------------------------
set statusline=%!vimrc#statusline()

" 7. Multiple tab pages
" ----------------------------------------------------------------------------
set showtabline=2

" 9. Using the mouse
" ----------------------------------------------------------------------------
set mouse=a

" 11. Messages and info
" ----------------------------------------------------------------------------
set confirm

" 13. Editing text
" ----------------------------------------------------------------------------
" NOTE I've decided that, in general, the following should not be included in
" formatoptions: w2vbmMB1p. 1 and p could be useful but only when writing
" prose.
set formatoptions+=nl

" NOTE: Mandatory settings for mucomplete
set completeopt+=menuone
set completeopt+=noselect

set undofile

" 15. Folding
" ----------------------------------------------------------------------------
set foldcolumn=2
set foldtext=vimrc#get_fold_text()

" 16. Diff mode
" ----------------------------------------------------------------------------
set diffopt+=vertical

" 17. Mapping
" ----------------------------------------------------------------------------
set timeoutlen=10000

" 18. Reading and writing files
" ----------------------------------------------------------------------------
set nomodeline
set modelines=0

" 19. The swap file
" ----------------------------------------------------------------------------
set updatetime=400

" 20. Command line editing
" ----------------------------------------------------------------------------
set wildcharm=<C-z>
set wildmode=longest:full

" 22. Running make and jumping to errors
" ----------------------------------------------------------------------------
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
set grepformat+=%f

" 25. Various
" ----------------------------------------------------------------------------
set virtualedit=block

" Embedded terminal options
" ----------------------------------------------------------------------------
if has('nvim')
  augroup terminal_options
    autocmd!
    autocmd TermOpen * setlocal nonumber
  augroup end
endif

" Stdin options
" ----------------------------------------------------------------------------
augroup stdin_options
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end

" Generic GUI options
" ----------------------------------------------------------------------------
if exists('&guifont')
    set guifont=Iosevka:h16
endif

" Firenvim options
" ----------------------------------------------------------------------------
if exists('g:started_by_firenvim')
  set guifont=Iosevka:h10
endif
