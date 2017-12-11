" Directory for plugins
call plug#begin('~/.vim/plugged')

" Plugins marked with * are recommended by https://www.vi-improved.org/plugins/
" Plugsins marked with x have problems
" TODO: Some plugins have problems. Test them and go through their issues on Github to find out which ones.

" TEXT OBJECTS:
" TODO: Kana's text objects affect '< and '> marks. The '' mark for yie also doesn't work properly
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'tpope/vim-surround' " * x
Plug 'wellle/targets.vim' " * x
Plug 'whatyouhide/vim-textobj-xmlattr'

" MOTIONS:
Plug 'chaoren/vim-wordmotion'
Plug 'justinmk/vim-sneak' " * x

" OPERATORS:
Plug 'kana/vim-operator-user' " x
Plug 'tommcdo/vim-lion' " *

" OTHER:
" Plug 'ludovicchabant/vim-gutentags' " *
" Plug 'tomtom/ttags_vim' " *
Plug 'editorconfig/editorconfig-vim' " x
Plug 'tpope/vim-characterize' " *
Plug 'tpope/vim-commentary' " * x
Plug 'tpope/vim-rsi' " * x

" EXPERIMENTAL:
Plug '/usr/local/opt/fzf' " x
Plug '907th/vim-auto-save' " x
Plug 'Asheq/close-buffers.vim' " x
Plug 'Konfekt/FastFold' " x
Plug 'ajh17/VimCompletesMe' " * x
Plug 'gcavallanti/vim-noscrollbar' " x
Plug 'haya14busa/vim-operator-flashy' " x
Plug 'junegunn/fzf.vim' " x
Plug 'justinmk/vim-dirvish' " * x
Plug 'mbbill/undotree' " * x
Plug 'mhinz/vim-grepper' " x
Plug 'nathanaelkane/vim-indent-guides' " x
Plug 'romainl/vim-qf' " * x
Plug 'terryma/vim-smooth-scroll' " x
Plug 'tpope/vim-abolish' " * x
Plug 'tpope/vim-eunuch' " * x
Plug 'tpope/vim-fugitive' " * x
Plug 'tpope/vim-repeat' " * x
Plug 'tpope/vim-unimpaired' " * x
Plug 'tyru/capture.vim' " x
Plug 'tyru/open-browser.vim' " x
Plug 'wellle/visual-split.vim' " x

" COLORS:
Plug 'jacoborus/tender.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'trusktr/seti.vim'

" FRONT END:
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'} " x

call plug#end() " 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
