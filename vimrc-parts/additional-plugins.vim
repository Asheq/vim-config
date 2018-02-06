" Directory for plugins
call plug#begin('~/.vim/plugged')

" [p] = problems (check Github issues)

" CREATE TEXT OBJECTS:
" TODO: yi<text-object> clobbers '< and '> marks (which also causes gv not to work as expected).
" TODO: Causes cursor flicker on yanking of certain text-object
Plug 'kana/vim-textobj-user' " [p]

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-line'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
" TODO: Causes cursor flicker on yib
" Plug 'wellle/targets.vim' " [p]

" MOTIONS AND TEXT OBJECTS:
" TODO: Causes cursor flicker on yiw
" Plug 'chaoren/vim-wordmotion'

" CREATE OPERATORS:
" Plug 'kana/vim-operator-user' " [p]

" OPERATORS:
Plug 'tommcdo/vim-lion'
" TODO: Causes screen flicker when it kicks off a search
Plug 'mhinz/vim-grepper'              " [p]
" TODO: Causes cursor flicker on gcc
Plug 'tpope/vim-commentary'           " [p]

" FUZZY FINDER:
Plug '/usr/local/opt/fzf' " [p]
Plug 'junegunn/fzf.vim' " [p]

" OTHER:
" TODO: Causes screen flicker on first ga
Plug 'Asheq/vim-characterize'
Plug '907th/vim-auto-save'             " [p]
Plug 'Asheq/close-buffers.vim'         " [p]
Plug 'Konfekt/FastFold'                " [p]
Plug 'editorconfig/editorconfig-vim'   " [p]
Plug 'gcavallanti/vim-noscrollbar'     " [p]
Plug 'justinmk/vim-dirvish'            " [p]
Plug 'mbbill/undotree'                 " [p]
Plug 'nathanaelkane/vim-indent-guides' " [p]
Plug 'osyo-manga/vim-anzu'             " [p]
Plug 'romainl/vim-qf'                  " [p]
Plug 'tpope/vim-abolish'               " [p]
Plug 'tpope/vim-eunuch'                " [p]
Plug 'tpope/vim-fugitive'              " [p]
Plug 'tpope/vim-repeat'                " [p]
Plug 'tpope/vim-rsi'                   " [p]
" TODO: Causes cursor flicker on dot-repeat of surround command
Plug 'tpope/vim-surround'              " [p]
" TODO: Causes cursor flicker ]<space>
Plug 'tpope/vim-unimpaired'            " [p]
Plug 'tyru/capture.vim'                " [p]
" TODO: Causes screen flicker on gx
Plug 'tyru/open-browser.vim'           " [p]
Plug 'wellle/visual-split.vim'         " [p]
" TODO: Replace easymotion with bi-directional sneak
Plug 'easymotion/vim-easymotion'       " [p]

" COLORS:
Plug 'jacoborus/tender.vim'

" FRONT END:
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'} " [p]

" WISH LIST:
" text objects:
  " saaguero/vim-textobj-pastedtext
  " sgur/vim-textobj-parameter
  " adriaanzon/vim-textobj-matchit
  " Julian/vim-textobj-variable-segment
  " saihoooooooo/vim-textobj-space or zandrmartin/vim-textobj-blanklines
" haya14busa/vim-easyoperator-line
" haya14busa/vim-edgemotion
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'
" AndrewRadev/switch.vim
" AndrewRadev/sideways.vim
" chrisbra/vim-diff-enhanced
" christoomey/vim-tmux-navigator
" scrooloose/nerdtree
" SirVer/ultisnips
" dyng/ctrlsf.vim
" Syntax checking
" Improved mappings
" Live completions
" Less flickering and better performance overall

call plug#end() " 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
