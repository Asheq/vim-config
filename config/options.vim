" vim: fdm=marker

" Miscellaneous {{{
  set backspace=indent,eol,start                      " allow normal backspacing in insert mode
  set history=1000                                    " lines of history to remember (for command line and search)
  set lazyredraw                                      " conservative redrawing
  set nostartofline                                   " keep cursor in same column for most jump commands
  set nrformats-=octal                                " do not consider numbers with leading zero as octals (for Ctrl-A and Ctrl-X)
  set path=,,**                                       " list of directories to search for files
  set synmaxcol=1000                                  " do not syntax highlight lines longer than this
  set ttyfast                                         " indicates fast terminal connection
  set viminfo^=!                                      " save and restore global variables that start with an uppercase letter, and don't contain a lowercase letter
  set virtualedit=block                               " allow virtual editing in Visual block mode
" }}}

" Display {{{
  set number                                          " show line numbers
  set display=lastline                                " show @@@ in the last line if it is truncated
  set cursorline
" }}}

" Buffer loading + unloading {{{
  set autoread                                        " auto-read a file when it is modified outside of Vim
  set hidden                                          " allow hiding buffers
" }}}

" Session Options {{{
  set sessionoptions+=slash,unix                      " make sure session files are Unix-compatible
  set sessionoptions-=options                         " do not save options with sessions
" }}}

" Timeout length {{{
  set timeoutlen=1000                                 " timeout length for mapped key sequences
  set ttimeoutlen=100                                 " timeout length for key codes
  set ttimeout
" }}}

" Mouse {{{
  set mouse=a                                         " enable mouse
  set mousehide                                       " hide mouse when characters are typed
" }}}

" Joining {{{
  set formatoptions+=j                                " remove comment leader when joining commented lines
  set nojoinspaces                                    " one (not two) spaces after punctuation on a join
" }}}

" Encoding + White space {{{
  set encoding=utf-8                                  " character encoding
  set list                                            " show white space
  if g:asheq#settings.special_chars
    set listchars=tab:‣ ,trail:˽,extends:>,precedes:<
  else
    set listchars=tab:» ,trail:¬,extends:>,precedes:<
  endif
" }}}

" Wrapping {{{
  " Note: Wrapping only changes how things are displayed (wrapped lines do not have EOL characters inserted)
  set linebreak                                       " wrap long lines at a character in 'breakat'
  set breakindent                                     " wrapped line will continue visually indented
  if g:asheq#settings.special_chars
    set showbreak=└→
  else
    set showbreak=+++
  endif
" }}}

" Max text width {{{
  " Note: EOL characters are inserted when typed text exceeds this limit and when formatting using gq
  set textwidth=100
" }}}

" Tabs and indents {{{
  set autoindent                                      " automatically indent to match adjacent lines
  set smarttab                                        " pressing tab key at BOL inserts shiftwidth, not tabstop, amount of space (if they differ)

  " Note: global ~/.editorconfig and project-specific .editorconfig files will override these:
  set tabstop=4                                       " spatial width between tab stops
  set shiftwidth=4                                    " spatial width of an indent
  set expandtab                                       " insert space chars when tab key pressed (and when indenting)
  set softtabstop=0                                   " disable this advanced option by setting to 0
" }}}

" Folding {{{
  set foldenable                                      " enable folds by default (toggle with zi)
  set foldmethod=syntax                               " fold via syntax by default (it is less performant than indent, but more useful)
  set foldlevelstart=99                               " open all folds by default
  set foldopen=all                                    " open a closed fold when moving into it
  set foldclose=all                                   " close an opened fold when moving into it
  set foldcolumn=4                                    " width of left-hand fold column
" }}}

" Search highlighting {{{
  set hlsearch                                        " highlight matches
  set incsearch                                       " highlight first match while typing
" }}}

" Search case {{{
  set ignorecase                                      " ignore case...
  set smartcase                                       " ...unless there's a capital letter in search pattern
" }}}

" Insert mode completion {{{
  set complete-=i                                     " do not scan 'included' files for completion candidates (tags are faster/superior)
  set infercase                                       " the case of a match is adjusted to the text typed so far
" }}}

" Status line {{{
  set laststatus=2                                    " always show status line
  if g:asheq#settings.special_chars
    let g:noscrollbar#track = '─'
    let g:noscrollbar#grip = '■'
  else
    let g:noscrollbar#track = '_'
    let g:noscrollbar#grip = '='
  endif
  set statusline=%<%f\ %h%m%r%=%-14.(%l%)\ %P\ %{noscrollbar#statusline(20,g:noscrollbar#track,g:noscrollbar#grip)}
" }}}

" Command line {{{
  set cmdheight=2                                     " screen line height of command line
  set fileignorecase                                  " ignore case when using file names and directories
  set showcmd                                         " show partial command or size of visual selection at bottom-right
  set wildmenu                                        " show completion matches in status line
  set wildmode=list:longest,full                      " command line completion behaviour
" }}}

" Matching brackets {{{
  set matchpairs+=<:>                                 " treat angle brackets as pairs
  set showmatch                                       " when a bracket is inserted, briefly jump to the matching one
  set matchtime=2                                     " tenths of a second to linger on matching bracket
" }}}

" Window direction + size {{{
  set noequalalways                                   " when splitting a window, leave size of other windows alone
  set splitbelow
  set splitright
" }}}

" Mode lines {{{
  set modeline                                        " read set commands embedded in files
  set modelines=1                                     " number of lines from top and bottom of file to look for set commands
" }}}

" Disable error bells {{{
  set noerrorbells
  set novisualbell
  set t_vb=
" }}}

" Undo, Backups, and Swaps {{{
  " Persistent undo
  if exists('persistent_undo')
    set undofile
    let &undodir = GetCacheDir('undo')
  endif

  " Backups
  set backup
  let &backupdir = GetCacheDir('backup')

  " Swap files
  let &directory = GetCacheDir('swap')
  set noswapfile

  call EnsureExists(g:asheq#settings.cache_dir)
  call EnsureExists(&undodir)
  call EnsureExists(&backupdir)
  call EnsureExists(&directory)
" }}}

" Use Ag as grep program {{{
  if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m,%f:%l:%c:%m
    "              \___________/ \_________/
    "                 DOS EOL     Unix EOL
    "                 <CR><LF>      <LF>
  endif
" }}}

" GUI {{{
  if has('gui_running')

    set guifont=Fantasque_Sans_Mono:h13

    " Open maximized {{{
      if has('win32')
        autocmd GUIEnter * simalt ~x
      endif
    " }}}

    " Remove GUI elements {{{
      set guioptions+=c                               " use console dialog instead of pop-up dialog
      set guioptions-=L                               " remove left scroll bar
      set guioptions-=T                               " remove toolbar (icons)
      set guioptions-=m                               " remove menu bar
      set guioptions-=r                               " remove right scroll bar
      set notitle                                     " remove filename from window title
    " }}}

    " Enable DirectX rendering {{{
      if g:asheq#settings.directx_rendering && has('win32')
        set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
      endif
    " }}}
  endif
" }}}
