" vim: fdm=marker

" Various {{{
  call EnsureExists(g:asheq#settings.cache_dir)       " create 'cache' root directory
  set viminfo^=!                                      " save and restore global variables that start with an uppercase letter, and don't contain a lowercase letter
  set virtualedit=block                               " allow virtual editing in Visual block mode

  " Session Options {{{
    set sessionoptions+=slash,unix                    " make sure session files are Unix-compatible
    set sessionoptions-=options                       " do not save options with sessions
  " }}}

" }}}

" Moving Around, Searching and Patterns {{{
  set path=,,**                                       " list of directories to search for files
  set nostartofline                                   " keep cursor in same column for most jump commands

  " Searching {{{
    set incsearch                                     " show match for partly typed search command
    set ignorecase                                    " ignore case...
    set smartcase                                     " ...unless there's a capital letter in search pattern
  " }}}

" }}}

" Syntax, Highlighting and Spelling {{{
  set synmaxcol=1000                                  " do not syntax highlight lines longer than this
  set hlsearch                                        " highlight search matches
  set cursorline                                      " highlight screen line of cursor
  " Hide cursorline in Insert mode
  autocmd InsertEnter,InsertLeave * set cul!
" }}}

" Terminal {{{
  set notitle                                         " do not show info in window title
  set ttyfast                                         " indicates fast terminal connection
" }}}

" Editing Text {{{
  set backspace=indent,eol,start                      " allow normal backspacing in insert mode
  set nrformats-=octal                                " do not interpret a number with a leading zero as an octal (for Ctrl-A and Ctrl-X)
  set textwidth=100                                   " line length above which to break a line (used for formatting with gq and white typing)

  " Joining {{{
    set formatoptions+=j                              " remove comment leader when joining commented lines
    set nojoinspaces                                  " one (not two) spaces after punctuation on a join
  " }}}

  " Insert-mode Completion {{{
    set complete-=i                                   " do not scan 'included' files for completion candidates (tags are faster/superior)
    set infercase                                     " adjust case of a completion match
  " }}}

  " Matching brackets {{{
    set showmatch                                     " when a bracket is inserted, briefly jump to the matching one
    set matchtime=2                                   " tenths of a second to linger on matching bracket for 'showmatch'
  " }}}

  " Persistent undo {{{
    if has('persistent_undo')
      set undofile                                    " automatically save and restore undo history
      let &undodir = GetCacheDir('undo')
      call EnsureExists(&undodir)
    endif
  " }}}

" }}}

" Multi-byte Characters {{{
  set encoding=utf-8                                  " character encoding
" }}}

" Displaying Text {{{
  set number                                          " show line numbers
  set cmdheight=2                                     " height of command line
  set lazyredraw                                      " don't redraw while executing macros
  set display=lastline                                " show @@@ in the last line if it does not fit

  " Special Characters {{{
    set list                                          " show special characters
    if g:asheq#settings.special_chars
      set listchars=tab:▸ ,trail:ᴗ,extends:>,precedes:<
    else
      set listchars=tab:» ,trail:¬,extends:>,precedes:<
    endif
  " }}}

  " Wrapping {{{
    " Note: Wrapping only changes how things are displayed, not the actual text contet, i.e., EOL characters are not inserted
    set linebreak                                     " wrap long lines at a character in 'breakat'
    set breakindent                                   " preserve indentation in wrapped text
    if g:asheq#settings.special_chars
      set showbreak=└►
    else
      set showbreak=+++
    endif
  " }}}

" }}}

" Reading and Writing Files {{{
  set autoread                                        " auto-read a file when modified outside of Vim

  " Modelines {{{
    set modeline                                      " read set commands embedded in files
    set modelines=1                                   " number of lines from top and bottom of file to look for set commands
  " }}}

  " Backups {{{
      set backup                                      " keep a backup after overwriting a file
      let &backupdir = GetCacheDir('backup')
      call EnsureExists(&backupdir)
  " }}}

" }}}

" Swap Files {{{
  set noswapfile                                      " do not use swap files
  let &directory = GetCacheDir('swap')
  call EnsureExists(&directory)
" }}}

" Multiple Windows {{{
  set hidden                                          " don't unload a buffer when not shown in a window

  " Status line {{{
    set laststatus=2                                  " always show status line
    if g:asheq#settings.special_chars
      let g:noscrollbar#track = '○'
      let g:noscrollbar#grip = '●'
    else
      let g:noscrollbar#track = '_'
      let g:noscrollbar#grip = '='
    endif
    set statusline=%<%f\ %h%m%r%=\ %l\ \/\ %L\ :\ \%P\ %{noscrollbar#statusline(6,g:noscrollbar#track,g:noscrollbar#grip)}
  " }}}

  " Window direction + size {{{
    set splitbelow                                    " a new window is put below the current one
    set splitright                                    " a new window is put right of the current one
    set noequalalways                                 " when adding/removing a window, do not change size of other windows
  " }}}

" }}}

" Mapping {{{
  set timeoutlen=1000                                 " timeout length for mapped key sequences
  set ttimeoutlen=10                                  " timeout length for key codes
  set ttimeout
" }}}

" Mouse {{{
  set mouse=a                                         " enable mouse
  set mousehide                                       " hide mouse pointer while typing
" }}}

" Tabs and Indenting {{{
  set autoindent                                      " automatically set the indent of a new line to match adjacent lines
  set smarttab                                        " pressing tab key at BOL inserts shiftwidth, not tabstop, amount of space (if they differ)

  " Note: global ~/.editorconfig and project-specific .editorconfig files will override these:
  set tabstop=4                                       " spatial width between tab stops
  set shiftwidth=4                                    " spatial width of an indent
  set expandtab                                       " insert space chars when tab key pressed (and when indenting)
  set softtabstop=0                                   " disable this advanced option by setting to 0
" }}}

" Folding {{{
  set foldenable                                      " enable folds by default (toggle with zi)
  set foldlevelstart=99                               " open all folds when starting to edit a file (this option only matters when foldenable is on)
  set foldmethod=syntax                               " fold via syntax by default (it is less performant than indent, but more useful)
  set foldcolumn=3                                    " width of fold column
  set foldopen=all                                    " auto-open a closed fold whenever curor moves inside of it
  set foldclose=all                                   " auto-close an opened fold whenever cursor moves outside of it
" }}}

" Command Line Editing {{{
  set history=1000                                    " lines of history to remember (for command line and search)
  set fileignorecase                                  " ignore case when using file names
  set wildmenu                                        " show completion matches in status line
  set wildmode=list:longest,full                      " complete command-line commands like an enhanced shell
" }}}

" Messages and Info {{{
  set showcmd                                         " show partial command keys or size of visual selection on last line of screen

  " Disable error bells {{{
    set errorbells                                    " ring bell for error messages
    set novisualbell                                  " beep instead of flashing the screen
  " }}}

" }}}

" Running Make and Jumping to Errors {{{

  " Use Ag as grep program {{{
    if executable('ag')
      set grepprg=ag\ --vimgrep\ $*
      set grepformat=%f:%l:%c:%m,%f:%l:%c:%m
      "              \___________/ \_________/
      "                 DOS EOL     Unix EOL
      "                 <CR><LF>      <LF>
    endif
  " }}}

" }}}

" GUI {{{
  if has('gui_running')

    set guifont=Consolas:h13

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
    " }}}

    " Enable DirectX rendering {{{
      if g:asheq#settings.directx_rendering && has('win32')
        set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
      endif
    " }}}

  endif
" }}}
