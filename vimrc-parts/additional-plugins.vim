" Directory for plugins
call plug#begin('~/.vim/plugged')

" Plugins from https://www.vi-improved.org/plugins/
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'
" Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-dirvish'
Plug 'mbbill/undotree'
Plug 'romainl/vim-qf'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
" TODO: Replace vim-sneak with easy motion for bi-directional jumping
Plug 'justinmk/vim-sneak'
" TODO: Replace vim-surround with generic operator plugin
Plug 'tpope/vim-surround'

" Text Object and Motion Plugins
" Plug 'glts/vim-textobj-comment'
Plug 'chaoren/vim-wordmotion'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'

" Operators
" Plug 'kana/vim-operator-replace'
" Plug 'rhysd/vim-operator-surround'
Plug 'kana/vim-operator-user'

" Other Plugins
" TODO: Add clever-f to free up ; and ,
" Plug 'metakirby5/codi.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Konfekt/FastFold'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'haya14busa/vim-operator-flashy'
Plug 'lifepillar/vim-mucomplete'
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'
Plug 'tyru/capture.vim'
Plug 'tyru/open-browser.vim'
Plug 'wellle/visual-split.vim'

" NEED:
" Async fuzzy finder for everything (buffers, MRU files, project files, arbitrary command menus, etc.). fzf!
" Async Syntax checker
" Async Git gutter
" Standardized code formatters

" EXTRA:
" Plug 'nathanaelkane/vim-indent-guides' or indent lines
" Snippets
" Ctrlsf and/or Far

" Front-end Plugins
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}
Plug 'heavenshell/vim-jsdoc'
" Plug 'mattn/emmet-vim'

call plug#end()
" NOTE: 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
