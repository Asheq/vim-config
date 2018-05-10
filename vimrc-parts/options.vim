" This file is organized like :options

" Vim {{{
if !has('nvim')
  " Make classic vim options equivalent to neovim defaults (see :h nvim-defaults)
  set autoindent
  set autoread
  set backspace=indent,eol,start
  let &backupdir=vimrc#get_vim_backup_dir()
  set belloff=all
  set complete-=i
  let &directory=vimrc#get_vim_swap_dir()
  set display=lastline
  set formatoptions=tcqj
  set history=1000
  set hlsearch
  set incsearch
  set langnoremap
  set nolangremap
  set laststatus=2
  let &listchars="tab:> ,trail:-,nbsp:+"
  set nocompatible
  set nrformats="bin,hex"
  set ruler
  set sessionoptions-=options
  set showcmd
  set smarttab
  set tabpagemax=50
  set tags=./tags;,tags
  set ttyfast
  let &undodir=vimrc#get_vim_undo_dir()
  set viminfo^=!
  set wildmenu

  " Set other options that vim needs
  let &t_EI="\<Esc>[2 q"
  let &t_SI="\<Esc>[6 q"
  let &t_SR="\<Esc>[4 q"
  set encoding=utf-8
  set ttymouse=sgr
endif
" }}}

" GUI {{{
if has('gui_running')
  if has('gui_macvim')
    set guifont=Monaco:h14
  else
    set guifont=Ubuntu_Mono:h14
  endif
endif
" }}}

" Moving Around, Searching and Patterns {{{
set path=,,**                         " Use recursive file search
set nostartofline                     " Don't move cursor to start of line after a jump command
set ignorecase                        " Ignore case...
set smartcase                         " ...unless there's a capital letter in search pattern
if exists("&inccommand")
  set inccommand=nosplit              " Show live substitutions (TODO: Report flickering)
endif
" }}}

" Displaying Text {{{
set cmdheight=2                       " Set height of command line
set number                            " Show line numbers
set list                              " Show special characters
set linebreak                         " Wrap lines at a character in 'breakat', rather than at last character
set breakindent                       " Preserve indentation in wrapped text
set nowrap                            " Don't wrap lines by default
if has('multi_byte')
  let &listchars='tab:▸ ,trail:‿,extends:▐,precedes:▌,nbsp:○'
  let &showbreak='→→→'
  let &fillchars='vert:│,fold:-'
else
  let &listchars='tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let &showbreak='+++'
endif
" }}}

" Syntax, Highlighting and Spelling {{{
set cursorline                        " Highlight line cursor is on
set termguicolors                     " Enable true color even in terminal (use guifg and guibg attributes)

" Choose background darkness based on time of day
if strftime("%H") < 14
  set background=light
else
  set background=dark
endif
" }}}

" Multiple Windows {{{
set hidden                            " Don't unload a buffer when not shown in a window
set noruler                           " Don't show ruler on statusline (causes flickering)
" }}}

" Using the Mouse {{{
set mouse=a                           " Enable mouse
set mousehide                         " Hide mouse pointer while typing
" }}}

" Messages and Info {{{
set noshowcmd                         " Don't show partial command (or size of visual selection) on last line of screen (causes flickering)
set noshowmode                        " Don't show mode in bottom-left (causes flickering)
set shortmess=
set shortmess+=F                      " Don't give the file info when editing a file, like `:silent` was used for the command
set shortmess+=c                      " Don't give insert completion messages
set confirm                           " Seek confirmation for certain commands instead of giving errors
" }}}

" Editing Text {{{
set dictionary+=/usr/share/dict/words " Use FreeBSD dictionary for insert-mode completion (Ctrl-X Ctrl-K)
set textwidth=100                     " Break lines with EOL character(s) after this column ...
set formatoptions-=c                  " ... but don't do it while typing live (only do it when formatting explicitly with 'gq')
set nojoinspaces                      " Add one (not two) spaces after punctuation on a join
set infercase                         " Adjust case of completion match
set pumheight=15                      " Limit height of pop-up menu
set completeopt-=menu
set completeopt+=menuone              " Use the popup menu also when there is only one match
set completeopt+=noselect             " Do not select a match in the menu
set undofile                          " Remember undo history
" }}}

" Folding {{{
set nofoldenable                      " Disable folds by default (toggle with zi)
set foldcolumn=2                      " Show this many columns of fold markers
" }}}

" Reading and Writing Files {{{
set modelines=1                       " Look for set commands this many lines from top and bottom of file
" }}}

" Command Line Editing {{{
set fileignorecase                    " Ignore case when using file names
set wildcharm=<C-z>                   " Allow using <C-z> to perform wildcard expansion in macros
set wildignore+=tags,.DS_Store        " Ignore files that match these patterns when expanding wild cards
set cmdwinheight=18                   " Height of the command window
set wildmode=list:longest             " When more than one match, list all matches and complete till longest common string
" }}}

" Running Make and Jumping to Errors {{{
if executable('ag') " TODO: use ripgrep
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif
" }}}

" Various {{{
set virtualedit=block                 " Allow 'virtual editing' in Visual block mode
" }}}

" vim: fdm=marker
