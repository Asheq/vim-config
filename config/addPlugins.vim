" vim: fdm=marker

" Begin {{{
  " Directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
  call plug#begin('~/.vim/plugged')
" }}}

if count(g:asheq#plugin_groups, 'general') " {{{

  " Tim Pope Plugins from https://www.vi-improved.org/plugins/ {{{
    " Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-characterize'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-rsi'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
  " }}}

  " Other Plugins from https://www.vi-improved.org/plugins/ {{{
    " Plug 'ludovicchabant/vim-gutentags'
    " Plug 'tomtom/ttags_vim'
    Plug 'ajh17/VimCompletesMe'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'justinmk/vim-dirvish'
    Plug 'justinmk/vim-sneak'
    Plug 'mbbill/undotree'
    Plug 'romainl/vim-qf'
    Plug 'romainl/vim-qlist'
    Plug 'tommcdo/vim-lion'
    Plug 'wellle/targets.vim'
  " }}}

  " Text Object and Motion Plugins {{{
    Plug 'chaoren/vim-wordmotion'
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-function'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-user'
    Plug 'thinca/vim-textobj-function-javascript'
  " }}}

  " Other Plugins {{{
    Plug 'Konfekt/FastFold'
    Plug 'justinmk/vim-gtfo'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'rstacruz/vim-closer'
    Plug 'tyru/capture.vim'
    Plug 'tyru/open-browser.vim'
    Plug 'vim-scripts/matchit.zip'
  " }}}

  " Denite and Sources {{{
    Plug 'Shougo/denite.nvim'
    Plug 'osyo-manga/unite-filetype'
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
