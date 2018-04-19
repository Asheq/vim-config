" Directory for plugins
call plug#begin('~/.vim/plugged')

" [p] = problems (check Github issues)
" TODO: Organize

" CREATE TEXT OBJECTS:
Plug 'kana/vim-textobj-user'           " [p], yi<text-object> clobbers '< and '> marks (which causes gv not to work as expected).

" CREATE OPERATORS:
" Plug 'kana/vim-operator-user'        " [p]

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'thinca/vim-textobj-function-javascript' " cursor flicker on yif in alacritty and vim
Plug 'whatyouhide/vim-textobj-xmlattr'
if has('gui_macvim') || has('nvim')
  Plug 'wellle/targets.vim'            " [p], cursor flicker on yib and others in alacritty and vim
endif

" OPERATORS:
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'              " [p], cursor flicker on dot-repeat of surround command in alacritty and vim

" MOTIONS:
Plug 'easymotion/vim-easymotion'       " [p]

" EX COMMANDS:
Plug 'Asheq/close-buffers.vim'         " [p]
Plug 'tyru/capture.vim'                " [p]
Plug 'tpope/vim-eunuch'                " [p]

" FUNCTIONS:
Plug 'gcavallanti/vim-noscrollbar'     " [p]

" MIXED AND OTHER:
Plug '907th/vim-auto-save'             " [p]
Plug 'Konfekt/FastFold'                " [p]
Plug 'editorconfig/editorconfig-vim'   " [p]
Plug 'justinmk/vim-dirvish'            " [p]
Plug 'mbbill/undotree'                 " [p]
Plug 'romainl/vim-qf'                  " [p]
Plug 'tomtom/tcomment_vim'             " [p] TODO: Don't create ic and ac text objects
Plug 'tpope/vim-abolish'               " [p]
Plug 'tpope/vim-characterize'          " [p]
Plug 'tpope/vim-fugitive'              " [p]
Plug 'tpope/vim-repeat'                " [p]
Plug 'tpope/vim-rsi'                   " [p]
Plug 'tpope/vim-unimpaired'            " [p], cursor flicker ]<space> in alacritty and vim
Plug 'tyru/open-browser.vim'           " [p], screen flicker on gx in alacritty
Plug 'wellle/visual-split.vim'         " [p]
Plug 'chrisbra/Colorizer'              " [p]

" COMPLETIONS:                         " [p]
if has('gui_macvim')
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'ajh17/VimCompletesMe'
elseif has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ajh17/VimCompletesMe'
else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'ajh17/VimCompletesMe'
endif

" FUZZY FINDER:
Plug '/usr/local/opt/fzf'              " [p]
Plug 'junegunn/fzf.vim'                " [p], screen and cursor flicker on Ctrl+c of fzf window in alacritty and vim

" COLORS:
Plug 'jacoborus/tender.vim'

" WISH LIST:
" miscellaneous
" ----------------------
" Improved mappings
" Less flickering and better performance overall in alacritty

" text objects
" ----------------------
" adriaanzon/vim-textobj-matchit
" Julian/vim-textobj-variable-segment
" saihoooooooo/vim-textobj-space or zandrmartin/vim-textobj-blanklines

" coding
" ----------------------
" Language server protocol?
" Quick info under cursor
" Goto definition under cursor
" Snippets
" Syntax checking
" more?

" miscellaneous plugins
" ----------------------
" haya14busa/vim-easyoperator-line
" haya14busa/vim-edgemotion
" AndrewRadev/switch.vim
" AndrewRadev/sideways.vim
" chrisbra/vim-diff-enhanced
" christoomey/vim-tmux-navigator
" scrooloose/nerdtree
" dyng/ctrlsf.vim

" tag plugins
" ----------------------
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'

call plug#end() " 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
