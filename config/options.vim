" vim: fdm=marker

" The option-window (see :options) is used as a template for organizing this file

" Various {{{
  set viminfo^=!                                      " remember any global variable that starts with an uppercase letter, and that doesn't contain a lowercase letter
  set virtualedit=block                               " allow 'virtual editing' in Visual block mode

  " Session Options {{{
    set sessionoptions+=slash,unix                    " make session files Unix-compatible
    set sessionoptions-=options                       " do not save options with sessions
  " }}}

" }}}

" Moving Around, Searching and Patterns {{{
  set path=,,**                                       " use these paths when searching for files
  set nostartofline                                   " do not move cursor to start of line after a jump command

  " Searching {{{
    set incsearch                                     " show first match for partly typed search pattern
    set ignorecase                                    " ignore case...
    set smartcase                                     " ...unless there's a capital letter in search pattern
  " }}}

" }}}

" Syntax, Highlighting and Spelling {{{
  set synmaxcol=1000                                  " do not syntax highlight lines longer than this
  set hlsearch                                        " highlight search matches
  set cursorline                                      " highlight cursor line
  " Hide cursorline in Insert mode
  autocmd InsertEnter * set nocul
  autocmd InsertLeave * set cul
" }}}

" Terminal {{{
  set title                                           " show window title
  set ttyfast                                         " assume fast terminal connection
" }}}

" Editing Text {{{
  set backspace=indent,eol,start                      " allow normal backspacing in insert mode
  set nrformats-=octal                                " do not interpret a number with a leading zero as an octal (for Ctrl-A and Ctrl-X)
  set textwidth=100                                   " break a line after this column (when formatting with gq and while typing)
  set formatoptions-=t                                " do not auto-wrap text using textwidth

  " Joining {{{
    set formatoptions+=j                              " remove comment leader when joining commented lines
    set nojoinspaces                                  " add one (not two) spaces after punctuation on a join
  " }}}

  " Insert-mode Completion {{{
    set complete-=i                                   " do not scan 'included' files for completion candidates (tags are faster/superior)
    set infercase                                     " adjust case of completion match
    set pumheight=8                                   " limit height of popup menu
  " }}}

  " Matching brackets {{{
    set showmatch                                     " briefly jump to matching opening bracket after typing closing bracket
    set matchtime=2                                   " linger on matching bracket for this many tenths of a second
  " }}}

  " Persistent undo {{{
    if has('persistent_undo')
      set undofile                                    " remember undo history
      let &undodir = GetCacheDir('undo')
    endif
  " }}}

" }}}

" Multi-byte Characters {{{
  set encoding=utf-8                                  " set character encoding
" }}}

" Displaying Text {{{
  set cmdheight=2                                     " set height of command line
  set lazyredraw                                      " don't redraw while executing macros
  set display=lastline                                " show @@@ in the last line if it does not fit
  set number                                          " show line numbers

  " Special Characters {{{
    set list                                          " show special characters
    if g:asheq#settings.cool_chars
      set listchars=tab:▸ ,trail:ᴗ,extends:>,precedes:<
    else
      set listchars=tab:» ,trail:¬,extends:>,precedes:<
    endif
  " }}}

  " Wrapping {{{
    " Note: Wrapping only changes how things are displayed, not the actual text content, i.e., EOL characters are not inserted
    set linebreak                                     " wrap long lines at a character in 'breakat'
    set breakindent                                   " preserve indentation in wrapped text
    if g:asheq#settings.cool_chars
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
    set modelines=1                                   " look for set commands this many lines from top and bottom of file
  " }}}

  " Backups {{{
      set backup                                      " keep a backup after overwriting a file
      let &backupdir = GetCacheDir('backup')
  " }}}

" }}}

" Swap Files {{{
  set noswapfile                                      " do not use swap files
  let &directory = GetCacheDir('swap')
" }}}

" Multiple Windows {{{
  set hidden                                          " don't unload a buffer when not shown in a window

  " Status line {{{
    set laststatus=2                                  " always show status line
    set statusline=%<\ %f\ %h%m%r%=%y\ %{&ff}\ %l\/\%L\ 
  " }}}

  " Window direction + size {{{
    set splitbelow                                    " put new horizontal window below current one
    set splitright                                    " put new vertical window to right of current one
    set noequalalways                                 " when adding/removing a window, do not change size of other windows
  " }}}

" }}}

" Multiple Tab Pages {{{
  set showtabline=2
" }}}

" Mapping {{{
  set timeoutlen=1000                                 " set timeout length for mapped key sequences
  set ttimeoutlen=10                                  " set timeout length for key codes
  set ttimeout
" }}}

" Mouse {{{
  set mouse=a                                         " enable mouse
  set mousehide                                       " hide mouse pointer while typing
" }}}

" Tabs and Indenting {{{
  set autoindent                                      " automatically set the indent of a new line to match adjacent lines
  set smarttab                                        " when tab key is pressed at BOL, insert shiftwidth (not tabstop) amount of space (if they differ)

  " Note: global ~/.editorconfig and project-specific .editorconfig files will override these:
  set tabstop=4                                       " set spatial width between tab stops
  set shiftwidth=4                                    " set spatial width of an indent
  set expandtab                                       " insert space chars when tab key pressed (and when indenting)
  set softtabstop=0                                   " disable softtabstop
" }}}

" Folding {{{
  set foldenable                                      " enable folds by default (toggle with zi)
  set foldlevelstart=99                               " open all folds when starting to edit a file
  set foldmethod=syntax                               " fold via syntax by default (it is less performant than indent, but more useful)
  set foldcolumn=3                                    " set width of fold column
  set foldnestmax=2                                   " set max fold depth
  set foldopen=all                                    " auto-open a closed fold whenever cursor moves inside of it
  set foldclose=all                                   " auto-close an opened fold whenever cursor moves outside of it
" }}}

" Command Line Editing {{{
  set history=1000                                    " remember this many lines of history (for command line and search)
  set fileignorecase                                  " ignore case when using file names
  set wildmenu                                        " show completion matches in status line
  set wildmode=list:longest,full                      " complete command-line commands like an enhanced shell
  set wildcharm=<C-z>                                 " allow using <C-z> to perform command-line completion in mapping
  set wildignore+=tags
  " TODO: wildignore
" }}}

" Messages and Info {{{
  set showcmd                                         " show partial command (or size of visual selection) on last line of screen

  " Disable error bells {{{
    set errorbells                                    " ring bell for error messages
    set novisualbell                                  " beep instead of flashing the screen
  " }}}

" }}}

" Running Make and Jumping to Errors {{{

  " compiler {name}
  " makeprg
  " errorformat

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
    set linespace=3

    " Open maximized {{{
      if has('win32')
        autocmd GUIEnter * simalt ~x
      endif
    " }}}

    " Remove GUI elements {{{
      set guioptions+=c                               " use console dialog instead of pop-up dialog
      set guioptions-=T                               " remove toolbar (icons)
      set guioptions-=m                               " remove menu bar
      set guioptions-=L                               " remove left scroll bar
      if asheq#settings.no_scrollbars
        set guioptions-=r                               " remove right scroll bar
      endif
    " }}}

    " Enable DirectX rendering {{{
      if g:asheq#settings.render_with_directx && has('win32')
        set renderoptions=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
      endif
    " }}}

  endif
" }}}
