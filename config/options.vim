" options.vim

" The option-window (see :options) is used as a template for organizing this file

" Multi-byte Characters {{{
  set encoding=utf-8                                " set character encoding
" }}}

" Moving Around, Searching and Patterns {{{
  set path=,,**                                     " use these directory names when file searching
  set nostartofline                                 " do not move cursor to start of line after a jump command

  " Searching
  set incsearch                                     " show first match for partly typed search command
  set ignorecase                                    " ignore case...
  set smartcase                                     " ...unless there's a capital letter in search pattern
  set nowrapscan                                    " do not wrap searches to other end of buffer TODO-HIGH: Determine if this is worth it

" }}}

" Syntax, Highlighting and Spelling {{{
  set synmaxcol=1000                                " do not syntax highlight lines longer than this
  set hlsearch                                      " highlight search matches
  set spell                                         " turn on spell checking

  " Hide cursorline in Insert mode
  set cursorline                                    " show cursorline
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline

" }}}

" Editing Text {{{
  set backspace=indent,eol,start                    " allow normal backspacing in insert mode
  set nrformats-=octal                              " do not interpret a number with a leading zero as an octal (for Ctrl-A and Ctrl-X)

  " Break lines
  set textwidth=100                                 " break lines with EOL character(s) after this column ...
  set formatoptions-=t                              " ... but do not do it while typing live (only do it when formatting explicitly with 'gq')
  set formatoptions-=c                              " ... for comments as well

  " Joining
  set formatoptions+=j                              " remove comment leader when joining commented lines
  set nojoinspaces                                  " add one (not two) spaces after punctuation on a join

  " Insert-mode Completion
  set complete-=i                                   " do not scan 'included' files for completion candidates (tags are faster/superior)
  set infercase                                     " adjust case of completion match
  set pumheight=8                                   " limit height of popup menu

  " Matching brackets
  set showmatch                                     " briefly jump to matching opening bracket after typing closing bracket
  set matchtime=2                                   " linger on matching bracket for this many tenths of a second

  " Persistent undo
  if has('persistent_undo')
    set undofile                                    " remember undo history
    let &undodir = GetCacheDir('undo')
  endif

" }}}

" Displaying Text {{{
  set cmdheight=2                                   " set height of command line
  set lazyredraw                                    " don't redraw while executing macros
  set display=lastline                              " show @@@ in the last line if it does not fit (only matters if wrap is on)
  set number                                        " show line numbers
  set list                                          " show special characters
  set linebreak                                     " wrap long lines at a character in 'breakat'
  set breakindent                                   " preserve indentation in wrapped text

  " Specify special characters
  if g:asheq#settings.pretty_chars
    set listchars=tab:► ,trail:ᴗ,extends:█,precedes:█
    set showbreak=➥\ 
  else
    set listchars=tab:» ,trail:¬,extends:>,precedes:<
    set showbreak=+++
  endif

" }}}

" Reading and Writing Files {{{
  set autoread                                      " auto-read a file when modified outside of Vim
  autocmd StdinReadPost * :set buftype=nofile       " treat buffers from stdin (e.g.: echo foo | vim -) as scratch. Credit: Steve Losh (sjl)

  " Modelines
  set modeline                                      " read set commands embedded in files
  set modelines=1                                   " look for set commands this many lines from top and bottom of file

  " Backups
  set backup                                        " keep a backup after overwriting a file
  let &backupdir = GetCacheDir('backup')

" }}}

" The Swap File {{{
  set swapfile                                      " use swap files
  let &directory = GetCacheDir('swap')
" }}}

" Multiple Windows {{{
  set hidden                                        " don't unload a buffer when not shown in a window
  set splitright                                    " split new window to right of current one
  set splitbelow                                    " split new window below current one

  " Status line
  set laststatus=2                                  " always show status line
  autocmd VimEnter * call s:set_statusline()        " give noscrollbar plugin a chance to define its functions before setting the statusline
  function s:set_statusline()
    if exists('*noscrollbar#statusline')
      if g:asheq#settings.pretty_chars
        let noscrollbar_track = '◌'
        let noscrollbar_grip = '●'
      else
        let noscrollbar_track = '='
        let noscrollbar_grip = '#'
      endif
      set statusline=%<%f\ %h%m%r\ 
      execute 'set statusline+=%4*\ %{noscrollbar#statusline(10,''' . noscrollbar_track . ''',''' . noscrollbar_grip . ''')}\ %P\ Ξ\ %L\ '
      set statusline+=%2*\ %{&fenc}\ 
      set statusline+=%3*\ %{&ff}\ 
      set statusline+=%1*\ %{GetTabOrSpaces()}\:%{&tabstop}\ 
      set statusline+=%6*\ %Y\ 
      set statusline+=%0*
    endif
  endfunction

  " Window size
  set noequalalways                                 " when adding/removing a window, do not change size of other windows
  autocmd VimResized * :wincmd =                    " resize splits when the window is resized. Credit: Steve Losh (sjl)

" }}}

" Multiple Tab Pages {{{
  set showtabline=1                                 " always show tab line
" }}}

" Tabs and Indenting {{{
  set autoindent                                    " automatically set the indent of a new line to match adjacent lines
  set smarttab                                      " when tab key is pressed at BOL, insert shiftwidth (not tabstop) amount of space (if they differ)

  " Note: .editorconfig files will override the following options if the editorconfig plugin is installed:
  set tabstop=4                                     " set spatial width between tab stops
  set shiftwidth=4                                  " set spatial width of an indent
  set expandtab                                     " insert space chars when tab key pressed (and when indenting)
  set softtabstop=0                                 " disable softtabstop
" }}}

" Folding {{{
  set nofoldenable                                  " disable folds by default (toggle with zi)
  set foldmethod=syntax                             " fold via syntax by default (it is less performant than indent, but more useful)
  set foldcolumn=3                                  " set width of fold column
  set foldnestmax=2                                 " set max fold depth
  set foldopen=all                                  " auto-open a closed fold whenever cursor moves inside of it
  set foldclose=all                                 " auto-close an opened fold whenever cursor moves outside of it
" }}}

" Command Line Editing {{{
  set history=1000                                  " remember this many lines of history (for command line and search)
  set fileignorecase                                " ignore case when using file names
  set wildmenu                                      " show completion matches in status line
  set wildmode=list:longest,full                    " complete command-line commands like an enhanced shell
  set wildcharm=<C-z>                               " allow using <C-z> to perform command-line completion in mapping
  set wildignore+=tags                              " ignore files that match these patterns when expanding wildcards
" }}}

" Messages and Info {{{
  set showcmd                                       " show partial command (or size of visual selection) on last line of screen

  " Disable error bells
  set errorbells                                    " ring bell for error messages
  set novisualbell                                  " beep instead of flashing the screen

" }}}

" Running Make and Jumping to Errors {{{
  " TODO-LOW: compiler, makeprg, errorformat

  " Use Ag as grep program
  if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m,%f:%l:%c:%m
    "              \___________/ \_________/
    "               for DOS EOL   for Unix EOL
    "                 <CR><LF>      <LF>
  endif

" }}}

" Executing External Commands {{{
  " TODO-LOW: formatprg, equalprg
" }}}

" Various {{{
  set viminfo^=!                                    " remember any all caps global variable
  set virtualedit=block                             " allow 'virtual editing' in Visual block mode

  " Session Options
  set sessionoptions+=slash,unix                    " make session files Unix-compatible
  set sessionoptions-=options                       " do not save options with sessions

" }}}

" Mouse {{{
  set mouse=a                                       " enable mouse
  set mousehide                                     " hide mouse pointer while typing
" }}}

" Mapping {{{
  set timeoutlen=1000                               " set timeout length for mapped key sequences
  set ttimeout                                      " set timeout for key codes
  set ttimeoutlen=100                               " set timeout length for key codes
" }}}

" Terminal {{{
  set notitle                                       " do not show info in window title
  set ttyfast                                       " assume fast terminal connection

  " Terminal codes
  if &term =~# 'xterm'
    set ttymouse=sgr                                " set name of terminal type for which mouse codes are to be recognized

    " " For Cursor
    if has("win32unix")
      let &t_ti.="\e[1 q"
      let &t_SI.="\e[5 q"
      let &t_EI.="\e[1 q"
      let &t_te.="\e[0 q"
    endif
  endif
" }}}

" GUI {{{
  if has('gui_running')

    set guifont=Ubuntu_Mono:h13                     " set font
    set linespace=3                                 " set number of pixels between lines

    " Open maximized
    if has('win32')
      autocmd GUIEnter * simalt ~x
    endif

    " Remove GUI elements
    set guioptions+=c                               " use console dialog instead of pop-up dialog
    set guioptions-=T                               " remove toolbar (icons)
    set guioptions-=m                               " remove menu bar
    if asheq#settings.no_gui_scrollbars
      set guioptions-=L                               " remove left scroll bar
      set guioptions-=r                             " remove right scroll bar
    endif

    " Enable DirectX rendering
    if g:asheq#settings.render_gui_with_directx && has('win32')
      set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
    endif

  endif
" }}}

" vim: fdm=marker
