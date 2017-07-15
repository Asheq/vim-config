" addPlugins.vim

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
Plug 'romainl/vim-qlist'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
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

" Other Plugins
Plug 'Konfekt/FastFold'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rstacruz/vim-closer'
Plug 'scrooloose/nerdtree'
Plug 'tyru/capture.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'wellle/visual-split.vim'
Plug 'beloglazov/vim-online-thesaurus'
" Live tab completions
" Syntax checker
" Nrrwrgn or alt
" Git gutter or alt
" Vim trailing white space or alt
" Ctrlsf or alt
" Vimref or alt
" CtrlP or alt

" Denite and Sources
Plug 'Shougo/denite.nvim'
Plug 'osyo-manga/unite-filetype'

" Front-end
" Plug 'mattn/emmet-vim'
" Plug 'marijnh/tern_for_vim'

" Colors
Plug 'flazz/vim-colorschemes'
Plug 'blueshirts/darcula'

" Initialize plugin system - automatically executes 'filetype plugin indent on' and 'syntax enable'
call plug#end()

" vim: fdm=marker
