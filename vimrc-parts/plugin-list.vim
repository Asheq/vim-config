" plugin-list.vim

" Disable some standard, built-in plugins
" TODO: Add more
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Directory for plugins
call plug#begin('~/.vim/plugged')

" Plugins from https://www.vi-improved.org/plugins/
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'
" Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'mbbill/undotree'
Plug 'romainl/vim-qf'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
" TODO: Replace with tComment to handle embedded syntax (e.g. JavaScript in HTML)
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'

" Text Object and Motion Plugins
Plug 'chaoren/vim-wordmotion'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'

" Operators
Plug 'kana/vim-operator-user'
" Plug 'rhysd/vim-operator-surround'

" Other Plugins
Plug 'Konfekt/FastFold'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rstacruz/vim-closer'
Plug 'tyru/capture.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'wellle/visual-split.vim'
Plug 'mhinz/vim-grepper'
Plug 'Asheq/close-buffers.vim'
" NEED:
" Live completions
" Git gutter or alternative
" Syntax checker
" Auto code formatters
" CtrlP or alternative
" EXTRA:
" Vimref or alternative
" Ctrlsf or alternative
" Nrrwrgn or alternative

" Denite and Sources
Plug 'Shougo/denite.nvim'

" Front-end Plugins
Plug 'ternjs/tern_for_vim'
" Plug 'mattn/emmet-vim'

" Initialize plugin system - automatically executes 'filetype plugin indent on' and 'syntax enable'
call plug#end()

" vim: fdm=marker
