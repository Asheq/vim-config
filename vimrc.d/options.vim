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
set list
set listchars=tab:·\ ,trail:￮,extends:▶,precedes:◀,nbsp:⏑
set number
set showbreak=└─▶
set cmdheight=2

" 5. Syntax, highlighting and spelling
" ----------------------------------------------------------------------------
set cursorline
set termguicolors

" 6. Multiple windows
" ----------------------------------------------------------------------------
set statusline=%!vimrc#get_statusline()

" 9. Using the mouse
" ----------------------------------------------------------------------------
set mouse=a

" 11. Messages and info
" ----------------------------------------------------------------------------
set confirm
set shortmess+=c " for coc

" 13. Editing text
" ----------------------------------------------------------------------------
set undofile

" 15. Folding
" ----------------------------------------------------------------------------
set foldcolumn=auto:5
set foldtext=vimrc#get_fold_text()

" 16. Diff mode
" ----------------------------------------------------------------------------
set diffopt+=vertical

" 17. Mapping
" ----------------------------------------------------------------------------
set timeoutlen=10000

" 19. The swap file
" ----------------------------------------------------------------------------
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience for coc
set updatetime=300

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
set shada+=!,'1000,<50,s10,h
" Always show the signcolumn, otherwise it would shift the text each time coc
" diagnostics appear/become resolved.
set signcolumn=yes

" Generic GUI options
" ----------------------------------------------------------------------------
if exists('&guifont')
    set guifont=Iosevka:h16
endif
