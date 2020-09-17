" The options here are grouped and organized like :options

" 2. Moving around, searching and patterns
" ----------------------------------------------------------------------------
set nowrapscan
if exists("&inccommand")
    set inccommand=split
endif

" 4. Displaying text
" ----------------------------------------------------------------------------
set breakindent
set cmdheight=3
set list
set listchars=tab:·\ ,trail:￮,extends:▶,precedes:◀,nbsp:⏑
set number
set showbreak=└─▶
set nowrap

" 5. Syntax, highlighting and spelling
" ----------------------------------------------------------------------------
set cursorline
set termguicolors

" 6. Multiple windows
" ----------------------------------------------------------------------------
set statusline=%!vimrc#get_statusline()

" 9. Using the mouse
" ----------------------------------------------------------------------------
set mouse=nv

" 11. Messages and info
" ----------------------------------------------------------------------------
set confirm

" 13. Editing text
" ----------------------------------------------------------------------------
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

" 20. Command line editing
" ----------------------------------------------------------------------------
set wildcharm=<C-z>
let &wildignore='.DS_Store,Icon,.tmp.drivedownload'

" 22. Running make and jumping to errors
" ----------------------------------------------------------------------------
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
set grepformat+=%f

" 25. Various
" ----------------------------------------------------------------------------
set virtualedit=block

" Generic GUI options
" ----------------------------------------------------------------------------
if exists('&guifont')
    set guifont=Iosevka:h16
endif
