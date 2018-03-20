" Directory for plugins
call plug#begin('~/.vim/plugged')

" [p] = problems (check Github issues)

" CREATE TEXT OBJECTS:
Plug 'kana/vim-textobj-user' " [p], yi<text-object> clobbers '< and '> marks (which also causes gv not to work as expected).

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'thinca/vim-textobj-function-javascript' " cursor flicker on yif
Plug 'whatyouhide/vim-textobj-xmlattr'
" Plug 'wellle/targets.vim' " [p], cursor flicker on yib

" MOTIONS AND TEXT OBJECTS:
" Plug 'chaoren/vim-wordmotion' " [p], cursor flicker on yiw

" CREATE OPERATORS:
" Plug 'kana/vim-operator-user' " [p]

" OPERATORS:
Plug 'mhinz/vim-grepper'              " [p], screen flicker when it kicks off a search using gr
Plug 'tommcdo/vim-lion'
Plug 'tomtom/tcomment_vim'

" FUZZY FINDER:
Plug '/usr/local/opt/fzf' " [p]
Plug 'junegunn/fzf.vim' " [p], screen flicker

" OTHER:
Plug '907th/vim-auto-save'             " [p]
Plug 'Asheq/close-buffers.vim'         " [p]
Plug 'Konfekt/FastFold'                " [p]
Plug 'easymotion/vim-easymotion'       " [p]
Plug 'editorconfig/editorconfig-vim'   " [p]
Plug 'gcavallanti/vim-noscrollbar'     " [p]
Plug 'justinmk/vim-dirvish'            " [p]
Plug 'mbbill/undotree'                 " [p]
Plug 'nathanaelkane/vim-indent-guides' " [p]
Plug 'romainl/vim-qf'                  " [p]
Plug 'tpope/vim-abolish'               " [p]
Plug 'tpope/vim-characterize'          " [p]
Plug 'tpope/vim-eunuch'                " [p]
Plug 'tpope/vim-fugitive'              " [p]
Plug 'tpope/vim-repeat'                " [p]
Plug 'tpope/vim-rsi'                   " [p]
Plug 'tpope/vim-surround'              " [p], cursor flicker on dot-repeat of surround command
Plug 'tpope/vim-unimpaired'            " [p], cursor flicker ]<space>
Plug 'tyru/capture.vim'                " [p]
Plug 'tyru/open-browser.vim'           " [p], screen flicker on gx
Plug 'wellle/visual-split.vim'         " [p]

" COLORS:
Plug 'jacoborus/tender.vim'

" FRONT END:
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'} " [p]

" WISH LIST:
" Improved mappings
" Less flickering and better performance overall

" text objects:
      " saaguero/vim-textobj-pastedtext
      " sgur/vim-textobj-parameter
      " adriaanzon/vim-textobj-matchit
      " Julian/vim-textobj-variable-segment
      " saihoooooooo/vim-textobj-space or zandrmartin/vim-textobj-blanklines

" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'

" SirVer/ultisnips
" Syntax checking
" Live completions

" haya14busa/vim-easyoperator-line
" haya14busa/vim-edgemotion
" AndrewRadev/switch.vim
" AndrewRadev/sideways.vim
" chrisbra/vim-diff-enhanced
" christoomey/vim-tmux-navigator
" scrooloose/nerdtree
" dyng/ctrlsf.vim

call plug#end() " 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
