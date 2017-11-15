" Directory for plugins
call plug#begin('~/.vim/plugged')

" RECOMMENDED: (https://www.vi-improved.org/plugins/)
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'
" Plug 'tpope/vim-fugitive'
Plug 'ajh17/VimCompletesMe'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'romainl/vim-qf'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'

" TEXT OBJECTS:
Plug 'kana/vim-textobj-syntax'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'adriaanzon/vim-textobj-matchit'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'

" MOTIONS:
Plug 'chaoren/vim-wordmotion'

" OPERATORS:
" Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'

" OTHER:
" Plug Async SCM diff (Signify or Git Gutter)
" Plug Async Linting (Ale or Other)
" Plug Async Syntax Highlighting
" Plug Format Code
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'Konfekt/FastFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'haya14busa/vim-operator-flashy'
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'
Plug 'tyru/capture.vim'
Plug 'tyru/open-browser.vim'
Plug 'wellle/visual-split.vim'
Plug 'trusktr/seti.vim'

" EXPERIMENTAL:
Plug 'metakirby5/codi.vim'
Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }

" FRONT END:
" Plug 'mattn/emmet-vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}

call plug#end() " 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
