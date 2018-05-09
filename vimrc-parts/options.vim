" This file is organized like :options

" Vim {{{
if !has('nvim')
  " Set options that are not needed in neovim (see :h vim_diff)
  set autoindent
  set autoread
  set backspace=indent,eol,start
  set belloff=all
  set complete-=i
  set display=lastline
  set encoding=utf-8
  set formatoptions+=j
  set history=1000
  set hlsearch
  set incsearch
  set langnoremap
  set laststatus=2
  set nolangremap
  set nrformats-=octal
  set sessionoptions-=options
  set smarttab
  set tabpagemax=50
  set tags=./tags;,tags
  set ttyfast
  set ttymouse=sgr
  set viminfo^=!
  set wildmenu
  let &t_EI="\<Esc>[2 q"
  let &t_SI="\<Esc>[6 q"
  let &t_SR="\<Esc>[4 q"
  let &undodir=vimrc#get_undo_dir()
  let &directory=vimrc#get_swap_dir()
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
set path=,,**                         " use recursive file search
set nostartofline                     " don't move cursor to start of line after a jump command
set ignorecase                        " ignore case...
set smartcase                         " ...unless there's a capital letter in search pattern
if exists("&inccommand")
  set inccommand=nosplit                " show live substitutions (causes flickering)
endif
" }}}

" Displaying Text {{{
set cmdheight=2                       " set height of command line
set number                            " show line numbers
set list                              " show special characters
set linebreak                         " wrap lines at a character in 'breakat', rather than at last character
set breakindent                       " preserve indentation in wrapped text
set nowrap                            " don't wrap lines by default
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
set cursorline                        " highlight line cursor is on
set termguicolors                     " enable true color even in terminal (use guifg and guibg attributes)
" choose background darkness based on time of day
if strftime("%H") < 14
  set background=light
else
  set background=dark
endif
" }}}

" Multiple Windows {{{
set hidden                            " don't unload a buffer when not shown in a window
set noruler                           " don't show ruler on statusline (causes flickering)
" }}}

" Using the Mouse {{{
set mouse=a                           " enable mouse
set mousehide                         " hide mouse pointer while typing
" }}}

" Messages and Info {{{
set noshowcmd                         " don't show partial command (or size of visual selection) on last line of screen (causes flickering)
set noshowmode                        " don't show mode in bottom-left (causes flickering)
set shortmess=
set shortmess+=F                      " don't give the file info when editing a file, like `:silent` was used for the command
set shortmess+=c                      " don't give insert completion messages
set confirm                           " seek confirmation for certain commands instead of giving errors
" }}}

" Editing Text {{{
set dictionary+=/usr/share/dict/words " use FreeBSD dictionary for insert-mode completion (Ctrl-X Ctrl-K)
set textwidth=100                     " break lines with EOL character(s) after this column ...
set formatoptions-=c                  " ... but don't do it while typing live (only do it when formatting explicitly with 'gq')
set nojoinspaces                      " add one (not two) spaces after punctuation on a join
set infercase                         " adjust case of completion match
set pumheight=15                      " limit height of pop-up menu
set completeopt-=menu
set completeopt+=menuone              " use the popup menu also when there is only one match
set completeopt+=noselect             " do not select a match in the menu
set undofile                          " remember undo history
" }}}

" Folding {{{
set nofoldenable                      " disable folds by default (toggle with zi)
set foldcolumn=2                      " show this many columns of fold markers
" }}}

" Reading and Writing Files {{{
set modelines=1                       " look for set commands this many lines from top and bottom of file
" }}}

" Command Line Editing {{{
set fileignorecase                    " ignore case when using file names
set wildcharm=<C-z>                   " allow using <C-z> to perform wildcard expansion in macros
set wildignore+=tags,.DS_Store        " ignore files that match these patterns when expanding wild cards
set cmdwinheight=18                   " height of the command window
" }}}

" Running Make and Jumping to Errors {{{
if executable('ag') " TODO: use ripgrep
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
endif
" }}}

" Various {{{
set virtualedit=block                 " allow 'virtual editing' in Visual block mode
" }}}

" vim: fdm=marker
