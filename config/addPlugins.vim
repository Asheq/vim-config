" vim: fdm=marker

" *** = plugins from https://www.vi-improved.org/plugins/

" Begin {{{
  " Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
  call plug#begin('~/.vim/plugged')
" }}}

if count(g:asheq#plugin_groups, 'general') " {{{

  " Text Objects and Motions {{{
    Plug 'chaoren/vim-wordmotion'
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-function'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-user'
    Plug 'thinca/vim-textobj-function-javascript'
  " }}}

  " Denite {{{
    " Plug 'tsukkee/unite-tag'
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/neomru.vim'
    Plug 'osyo-manga/unite-filetype'
  " }}}

  " Tim Pope {{{
    " Plug 'tpope/vim-fugitive' " ***
    Plug 'tpope/vim-abolish' " ***
    Plug 'tpope/vim-characterize' " ***
    Plug 'tpope/vim-commentary' " ***
    Plug 'tpope/vim-eunuch' " ***
    Plug 'tpope/vim-repeat' " ***
    Plug 'tpope/vim-rsi' " ***
    Plug 'tpope/vim-surround' " ***
    Plug 'tpope/vim-unimpaired' " ***
  " }}}

  " Other {{{
    " Plug 'ludovicchabant/vim-gutentags' " ***
    " Plug 'mbbill/undotree' " ***
    " Plug 'tomtom/ttags_vim' " ***
    Plug 'Konfekt/FastFold'
    Plug 'ajh17/VimCompletesMe' " ***
    Plug 'editorconfig/editorconfig-vim'
    Plug 'justinmk/vim-dirvish' " ***
    Plug 'justinmk/vim-gtfo'
    Plug 'justinmk/vim-sneak' " ***
    Plug 'moll/vim-bbye'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'romainl/vim-qf' " ***
    Plug 'romainl/vim-qlist' " ***
    Plug 'rstacruz/vim-closer'
    Plug 'tommcdo/vim-lion' " ***
    Plug 'tyru/open-browser.vim'
    Plug 'vim-scripts/matchit.zip'
    Plug 'wellle/targets.vim' " ***
  " }}}

endif " }}}

if count(g:asheq#plugin_groups, 'web') " {{{
  " Plug 'mattn/emmet-vim'
endif " }}}

if count(g:asheq#plugin_groups, 'javascript') " {{{
  " Plug 'marijnh/tern_for_vim'
endif " }}}

if count(g:asheq#plugin_groups, 'colors') " {{{
  Plug 'flazz/vim-colorschemes'
  Plug 'jacoborus/tender.vim'
endif " }}}

" End {{{
  " Initialize plugin system - automatically executes 'filetype plugin indent on' and 'syntax enable'
  call plug#end()
" }}}
