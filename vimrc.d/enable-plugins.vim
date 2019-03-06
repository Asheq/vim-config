" TODO-WAIT: Review all plugins. Try to remove and replace with simpler implementations.

call plug#begin('~/.vim/plugged')

" Motions {{{
Plug 'justinmk/vim-sneak'        " 👍 GH Issues: 12
Plug 'haya14busa/vim-edgemotion' " 👍 GH Issues: 1
" }}}

" Create text objects " {{{
Plug 'kana/vim-textobj-user' " TODO-WAIT: Create text objects yourself using the officially endorsed pattern
" }}}

" Text objects " {{{
Plug 'glts/vim-textobj-comment'               " TODO-WAIT: Replace
Plug 'kana/vim-textobj-entire'                " TODO-WAIT: Replace
Plug 'kana/vim-textobj-function'              " TODO-WAIT: Replace
Plug 'kana/vim-textobj-indent'                " TODO-WAIT: Replace
Plug 'kana/vim-textobj-line'                  " TODO-WAIT: Replace
Plug 'sgur/vim-textobj-parameter'             " TODO-WAIT: Replace
Plug 'thinca/vim-textobj-function-javascript' " TODO-WAIT: Replace
Plug 'whatyouhide/vim-textobj-xmlattr'        " TODO-WAIT: Replace
Plug 'wellle/targets.vim'                     " 👍 GH Issues: 15
" }}}

" Operators " {{{
Plug 'arthurxavierx/vim-caser' " 👍 GH Issues: 1
Plug 'tommcdo/vim-lion'        " 👍 GH Issues: 2
Plug 'tpope/vim-commentary'    " 👍 GH Issues: 15
Plug 'tpope/vim-surround'      " TODO-WAIT: Replace with machakann/vim-sandwich or rhysd/vim-operator-surround
" }}}

" Directory viewer " {{{
Plug 'justinmk/vim-dirvish'           " 👍 GH Issues: 9
" }}}

" Completion " {{{
" Plug 'lifepillar/vim-mucomplete' " ...
" }}}

" Fuzzy finder " {{{
" Plug '/usr/local/opt/fzf' " ...
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'   " ...
" }}}

" Text editing ex commands " {{{
Plug 'AndrewRadev/sideways.vim'    " ...
Plug 'tek/vim-fieldtrip'           " ...
Plug 'tpope/vim-abolish'           " ...
" }}}

" Other " {{{
Plug 'AndrewRadev/inline_edit.vim'                  " ...
Plug 'Asheq/close-buffers.vim'                      " 👍 GH Issues: 0
Plug 'haya14busa/vim-asterisk'                      " TODO-WAIT: Replace with own simple implementation
Plug 'kana/vim-submode'                             " ...
Plug 'luochen1990/rainbow'                          " ...
Plug 'machakann/vim-highlightedyank'                " 👍 GH Issues: 1
Plug 'mbbill/undotree'                              " 👍 GH Issues: 5
Plug 'romainl/vim-qf'                               " TODO-WAIT: Fork or replace with own implementation
Plug 'sgur/vim-editorconfig'                        " 👍 GH Issues: 5
Plug 'tpope/vim-apathy'                             " TODO-WAIT: Replace with language-specific plugins
Plug 'tpope/vim-characterize'                       " 👍 GH Issues: 1
Plug 'tpope/vim-eunuch'                             " 👍 GH Issues: 10
Plug 'tpope/vim-flagship'                           " 👍 GH Issues: 2
Plug 'tpope/vim-fugitive'                           " ...
Plug 'tpope/vim-repeat'                             " ...
Plug 'tpope/vim-rsi'                                " TODO-WAIT: Replace with something that is exactly like Readline
Plug 'tpope/vim-unimpaired'                         " TODO-WAIT: Replace with submode mappings
Plug 'tyru/capture.vim'                             " 👍 GH Issues: 0
Plug 'tyru/open-browser.vim'                        " 👍 GH Issues: 8
Plug 'wellle/visual-split.vim'                      " 👍 GH Issues: 1
Plug 'gcavallanti/vim-noscrollbar'                  " 👍 GH Issues: 1
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " TODO: Find best option
" }}}

" Classic vim only {{{
if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults' " ...
endif
" }}}

call plug#end() " Automatically executes 'filetype plugin indent on' and 'syntax enable'.

" vim: fdm=marker
