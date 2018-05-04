" The option-window is used as a template for organizing this file (see :options)

" Classic vim {{{
if !has('nvim')
  " Options that neovim either ignores or sets by default (see :h nvim-defaults and :h vim-differences)
  let &t_EI = "\<Esc>[2 q"
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &undodir = vimrc#get_cache_dir('undo')
  let &directory = vimrc#get_cache_dir('swap')
  set autoindent                      " automatically set the indentation of a new line to match adjacent lines
  set autoread                        " auto-read a file when modified outside of Vim
  set backspace=indent,eol,start      " allow normal backspacing in insert mode
  set belloff=all                     " don't ring the bell for any events
  set complete-=i                     " don't scan 'included' files for completion candidates (tags are faster/superior)
  set display=lastline                " show @@@ in the last line if it doesn't fit (only matters if wrap is on)
  set encoding=utf-8                  " set character encoding
  set history=1000                    " remember this many lines of history (for ex commands, search, etc.)
  set hlsearch                        " highlight search matches
  set incsearch                       " show first match for partially typed search command
  set langnoremap                     " alias to nolangremap
  set laststatus=2                    " always show status line
  set nolangremap                     " ???
  set nrformats-=octal                " don't interpret a number with a leading zero as an octal (for Ctrl-A and Ctrl-X)
  set sessionoptions-=options         " don't save options with sessions
  set smarttab                        " when tab key is pressed at BOL, insert shiftwidth (not tabstop) amount of space if they differ
  set tags=./tags;,tags               " search these files for tags
  set ttyfast                         " assume fast terminal connection
  set ttymouse=sgr                    " set type of terminal for which mouse codes are to be recognized
  set viminfo^=!                      " remember any global variable that is all caps
  set wildmenu                        " show completion matches in status line
endif
" }}}

" TODO: Do these make a difference?
let g:python_host_prog  = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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
set path=,,**                         " use these directory names when searching for files, e.g., with gf
set nostartofline                     " don't move cursor to start of line after a jump command
set ignorecase                        " ignore case...
set smartcase                         " ...unless there's a capital letter in search pattern
if exists("&inccommand")
  set inccommand=split                " show partial off-screen results in a preview window for commands like :sub
endif
" }}}

" Displaying Text {{{
set cmdheight=2                       " set height of command line
set number                            " show line numbers
set list                              " show special characters
set linebreak                         " wrap long lines at a character in 'breakat'
set breakindent                       " preserve indentation in wrapped text
set nowrap                            " don't wrap long lines
if has('multi_byte')
  let &listchars = 'tab:▸ ,trail:‿,extends:▶,precedes:◀,nbsp:○'
  let &showbreak='→→→'
  let &fillchars='vert:│,fold:-'
else
  let &listchars = 'tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let &showbreak='+++'
endif
" }}}

" Syntax, Highlighting and Spelling {{{
set cursorline                        " highlight line cursor is on
set termguicolors                     " use guifg and guibg attributes in the terminal
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
set shortmess+=c                      " don't give completion messages
" }}}

" Editing Text {{{
set dictionary+=/usr/share/dict/words " use FreeBSD dictionary for insert-mode completion (Ctrl-X Ctrl-K)
set textwidth=100                     " break lines with EOL character(s) after this column ...
set formatoptions-=c                  " ... but don't do it while typing live (only do it when formatting explicitly with 'gq')
set nojoinspaces                      " add one (not two) spaces after punctuation on a join
set infercase                         " adjust case of completion match
set pumheight=15                      " limit height of pop-up menu
set completeopt-=menu
set completeopt+=menuone
set completeopt+=noselect
set undofile                          " remember undo history
" }}}

" Folding {{{
set nofoldenable                      " disable folds by default (toggle with zi)
set foldopen=all                      " auto-open a closed fold whenever cursor moves inside of it
set foldclose=all                     " auto-close an opened fold whenever cursor moves outside of it
" }}}

" Reading and Writing Files {{{
set modelines=1                       " look for set commands this many lines from top and bottom of file
" }}}

" Command Line Editing {{{
set fileignorecase                    " ignore case when using file names
set wildcharm=<C-z>                   " allow using <C-z> to perform command-line completion in mappings
set wildignore+=tags,.DS_Store        " ignore files that match these patterns when expanding wild cards
" }}}

" Running Make and Jumping to Errors {{{
if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat=%f:%l:%c:%m
  " TODO: compiler, makeprg, etc.
endif
" }}}

" Various {{{
set virtualedit=block                 " allow 'virtual editing' in Visual block mode
" }}}

" vim: fdm=marker
