" Directory for plugins
call plug#begin('~/.vim/plugged')

" [p] = problems (check Github issues)

" CREATE TEXT OBJECTS:
" TODO: Affects '< and '> marks. The '' mark for yie also doesn't work properly
Plug 'kana/vim-textobj-user' " [p]

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-line'
Plug 'whatyouhide/vim-textobj-xmlattr'
" TODO: Causes cursor flicker on yae and yie
Plug 'kana/vim-textobj-entire'
" TODO: Causes cursor flicker on yii
Plug 'kana/vim-textobj-indent'
" TODO: Causes cursor flicker on yaf and yif
Plug 'kana/vim-textobj-function'
" TODO: yaf and yif flicker
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
Plug 'tpope/vim-commentary'           " [p]
" TODO: Causes cursor flicker on yiw. Try flashy.
" Plug 'machakann/vim-highlightedyank'  " [p]

" FUZZY FINDER:
Plug '/usr/local/opt/fzf' " [p]
Plug 'junegunn/fzf.vim' " [p]

" OTHER:
" TODO: Causes screen flicker on first ga and sometimes cursor flicker on all ga
Plug 'tpope/vim-characterize'
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
Plug 'tpope/vim-unimpaired'            " [p]
Plug 'tyru/capture.vim'                " [p]
" TODO: Causes screen flicker on gx
Plug 'tyru/open-browser.vim'           " [p]
Plug 'wellle/visual-split.vim'         " [p]

" COLORS:
Plug 'jacoborus/tender.vim'

" FRONT END:
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'} " [p]

" WISH LIST:
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'
" easymotion
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
