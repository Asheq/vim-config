call plug#begin('~/.vim/plugged')

" Motions {{{
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/vim-edgemotion'
Plug 'jeetsukumaran/vim-indentwise'
" }}}

" Create text objects " {{{
Plug 'kana/vim-textobj-user' " TODO-WAIT: Create text objects yourself using the officially endorsed pattern
" }}}

" Text objects " {{{
Plug 'glts/vim-textobj-comment' " TODO-WAIT: Replace
Plug 'kana/vim-textobj-entire' " TODO-WAIT: Replace
Plug 'kana/vim-textobj-function' " TODO-WAIT: Replace
Plug 'kana/vim-textobj-indent' " TODO-WAIT: Replace
Plug 'kana/vim-textobj-line' " TODO-WAIT: Replace
Plug 'sgur/vim-textobj-parameter' " TODO-WAIT: Replace
Plug 'thinca/vim-textobj-function-javascript' " TODO-WAIT: Replace
Plug 'whatyouhide/vim-textobj-xmlattr' " TODO-WAIT: Replace
Plug 'wellle/targets.vim'
" }}}

" Operators " {{{
Plug 'arthurxavierx/vim-caser'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround' " TODO-WAIT: Replace with machakann/vim-sandwich
" }}}

" Directory viewer " {{{
Plug 'justinmk/vim-dirvish'
" }}}

" Completion " {{{
Plug 'lifepillar/vim-mucomplete'
" }}}

" Fuzzy finder " {{{
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" Text editing ex commands " {{{
Plug 'AndrewRadev/sideways.vim'
Plug 'tek/vim-fieldtrip'
Plug 'tpope/vim-abolish'
" }}}

" Other " {{{
Plug 'AndrewRadev/inline_edit.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'Asheq/vim-flagship'
Plug 'Asheq/vim-smooth-scroll'
Plug 'KabbAmine/vCoolor.vim'
" TODO: Submit GitHub issue about error when using vimgrep
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'haya14busa/vim-asterisk'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/goyo.vim'
Plug 'kana/vim-submode'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'romainl/vim-qf' " TODO-WAIT: Fork or replace with own implementation
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-apathy' " TODO-WAIT: Replace with language-specific plugins
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi' " TODO-WAIT: Replace with something that is exactly like Readline
Plug 'tpope/vim-unimpaired'
Plug 'tyru/capture.vim'
Plug 'tyru/open-browser.vim'
Plug 'wellle/visual-split.vim'
" }}}

" Language-specific {{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" }}}

" Classic vim only {{{
if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif
" }}}

call plug#end() " Automatically executes 'filetype plugin indent on' and 'syntax enable'.

" vim: fdm=marker
