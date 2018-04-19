" The option-window (see :options) is used as a template for organizing this file

" Important {{{
set nocompatible                                    " use vim (not vi) settings (must be first)
set all&                                            " reset all options to default (overrides values set by global config, /etc/vimrc)

" Make Windows use the same runtimepath as Unix-like systems
if has('win32')
  set runtimepath+=~/.vim
endif
" }}}

" Multi-byte Characters {{{
set encoding=utf-8                                  " set character encoding
" }}}

" Moving Around, Searching and Patterns {{{
set path=,,**                                       " use these directory names when file searching
set nostartofline                                   " do not move cursor to start of line after a jump command

" Searching
set incsearch                                       " show first match for partially typed search command
set ignorecase                                      " ignore case...
set smartcase                                       " ...unless there's a capital letter in search pattern
set wrapscan                                        " wrap searches to other end of buffer
" }}}

" Tags {{{
set tags=./tags;,tags                               " ???
" }}}

" Displaying Text {{{
set cmdheight=2                                     " set height of command line
if has('gui_macvim')
  set lazyredraw                                    " do not redraw while executing macros
else
  set nolazyredraw
endif
set display=lastline                                " show @@@ in the last line if it does not fit (only matters if wrap is on)
set number                                          " show line numbers
set list                                            " show special characters
set linebreak                                       " wrap long lines at a character in 'breakat'
set breakindent                                     " preserve indentation in wrapped text
set nowrap                                          " wrap long lines

" Specify special characters
if g:asheq#settings.pretty_chars
  set listchars=tab:▸ ,trail:ᴗ,extends:█,precedes:█,nbsp:+
  set showbreak=↪\ 
else
  set listchars=tab:» ,trail:¬,extends:>,precedes:<
  set showbreak=+++
endif
" }}}

" Syntax, Highlighting and Spelling {{{
set synmaxcol=500                                   " do not syntax highlight lines longer than this
set hlsearch                                        " highlight search matches
set nospell                                         " turn spell checking off
set cursorline                                      " show cursorline
" }}}

" Multiple Windows {{{
set hidden                                          " don't unload a buffer when not shown in a window
set splitbelow                                      " split to the bottom
set splitright                                      " split to the right

" Status line
set laststatus=2                                    " always show status line
set noruler                                         " do not show ruler on statusline
" TODO: Most statusline modifications cause cursor flicker in alacritty and vim

" Window size
set noequalalways                                   " when adding/removing a window, do not change size of other windows
" }}}

" Multiple Tab Pages {{{
set showtabline=1                                   " always show tab line
" }}}

" Terminal {{{
set notitle                                         " don't show title in terminal window
set ttyfast                                         " assume fast terminal connection

" Cursor codes
" To specify codes that Vim should send to the terminal in various scenarios, Vim allows us to tweak the following options:
" - t_EI code is sent at normal-mode invocation
" - t_SI code is sent at insert-mode invocation
" - t_SR code is sent at replace-mode invocation
" if &term =~# 'xterm'
  let &t_EI = "\<Esc>[2 q"
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
" endif
" }}}

" Using the Mouse {{{
set mouse=a                                         " enable mouse
set mousehide                                       " hide mouse pointer while typing
if !has('nvim') && &term =~# 'xterm'
  set ttymouse=sgr                                  " set type of terminal for which mouse codes are to be recognized
endif
" }}}

" Messages and Info {{{
" TODO: showcmd causes cursor flicker on <C-a>, etc. in alacritty and vim
set noshowcmd                                       " don't show partial command (or size of visual selection) on last line of screen
" TODO: showmode causes cursor flicker on v in. etc. alacritty and vim
set noshowmode                                      " don't show mode in bottom-left
set shortmess=
set shortmess+=I                                    " don't give intro message
set shortmess+=F                                    " don't give the file info when editing a file, like `:silent` was used for the command

" Disable error bells
set belloff=all                                     " ???
set errorbells                                      " ring bell for error messages
set novisualbell                                    " beep instead of flashing the screen
" }}}

" Editing Text {{{
set backspace=indent,eol,start                      " allow normal backspacing in insert mode
set nrformats-=octal                                " do not interpret a number with a leading zero as an octal (for Ctrl-A and Ctrl-X)
set dictionary+=/usr/share/dict/words               " use FreeBSD dictionary for insert-mode completion (Ctrl-X Ctrl-K)
set formatoptions+=ro                               " auto insert comment leader after hitting <Enter> in insert mode or o/O in normal mode

" Break lines
set textwidth=100                                   " break lines with EOL character(s) after this column ...
set formatoptions-=tc                                " ... but do not do it while typing live (only do it when formatting explicitly with 'gq')

" Joining
set formatoptions+=j                                " remove comment leader when joining commented lines
set nojoinspaces                                    " add one (not two) spaces after punctuation on a join

" Insert-mode Completion
set complete-=i                                     " do not scan 'included' files for completion candidates (tags are faster/superior)
set infercase                                       " adjust case of completion match
set pumheight=15                                    " limit height of popup menu

" Matching brackets
set showmatch                                       " briefly jump to matching opening bracket after typing closing bracket
set matchtime=2                                     " linger on matching bracket for this many tenths of a second

" Persistent undo
set undofile                                        " remember undo history
if !has('nvim')
  let &undodir = vimrc#get_cache_dir('undo')
endif
" }}}

" Tabs and Indenting {{{
set autoindent                                      " automatically set the indent of a new line to match adjacent lines
set smarttab                                        " when tab key is pressed at BOL, insert shiftwidth (not tabstop) amount of space if they differ

" Note: .editorconfig files will override the following options if the editorconfig plugin is installed:
set tabstop=4                                       " set spatial width between tab stops
set shiftwidth=4                                    " set spatial width of an indent (indent operations include >>, <<, ==)
set expandtab                                       " insert (appropriate number of) space chars when tab key is pressed (and when indenting)
set softtabstop=0                                   " disable softtabstop
" }}}

" Folding {{{
set nofoldenable                                    " disable folds by default (toggle with zi)
" TODO: foldcolumn=x causes screen flicker on <C-f> and <C-b> hold in alacritty and vim
set foldcolumn=0                                    " set width of fold column
set foldnestmax=10                                  " set max fold depth
set foldopen=all                                    " auto-open a closed fold whenever cursor moves inside of it
set foldclose=all                                   " auto-close an opened fold whenever cursor moves outside of it
" }}}

" Mapping {{{
set timeoutlen=1000                                 " set timeout length for mapped key sequences
set ttimeout                                        " set timeout for key codes
set ttimeoutlen=5                                   " set timeout length for key codes
" }}}

" Reading and Writing Files {{{
set autoread                                        " auto-read a file when modified outside of Vim

" Modelines
set modeline                                        " read set commands embedded in files
set modelines=1                                     " look for set commands this many lines from top and bottom of file

" Backups
set backup                                          " keep a backup after overwriting a file
if !has('nvim')
  let &backupdir = vimrc#get_cache_dir('backup')
endif
" }}}

" The Swap File {{{
set swapfile                                        " use swap files
if !has('nvim')
  let &directory = vimrc#get_cache_dir('swap')
endif
" }}}

" Command Line Editing {{{
set history=1000                                    " remember this many lines of history (for command line and search)
set fileignorecase                                  " ignore case when using file names
set wildmenu                                        " show completion matches in status line
set wildmode=longest,list                           " complete command-line commands just like bash
set wildcharm=<C-z>                                 " allow using <C-z> to perform command-line completion in mapping
set wildignore+=tags                                " ignore files that match these patterns when expanding wildcards
set wildignore+=.DS_Store
" }}}

" Running Make and Jumping to Errors {{{
" TODO: compiler, makeprg, errorformat

" Use Ag as grep program
if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m\\\,%f:%l:%c:%m
  "              \___________/ \_________/
  "               for DOS EOL   for Unix EOL
  "                 <CR><LF>      <LF>
endif
" }}}

" Language Specific {{{
set langnoremap                                     " ???
set nolangremap                                     " ???
" }}}

" Various {{{
set viminfo^=!                                      " remember any all caps global variable
set virtualedit=block                               " allow 'virtual editing' in Visual block mode

" Session Options
set sessionoptions+=slash,unix                      " make session files Unix-compatible
set sessionoptions-=options                         " do not save options with sessions
" }}}

" GUI {{{
if has('gui_running')

  " Set Font
  if has('gui_macvim')
    set guifont=Monaco:h14
  else
    set guifont=Ubuntu_Mono:h14
  endif

  " Remove GUI elements
  set guioptions+=c                                 " use console dialog instead of pop-up dialog
  set guioptions-=T                                 " remove toolbar (icons)
  set guioptions-=m                                 " remove menu bar
  set guioptions-=L                                 " remove left scroll bar
  set guioptions-=r                                 " remove right scroll bar

endif
" }}}

" vim: fdm=marker
