" TODO: Review all plugins.

call plug#begin('~/.vim/plugged')

" Motions {{{
Plug 'justinmk/vim-sneak'        " ...
Plug 'haya14busa/vim-edgemotion' " ...
" }}}

" Create text objects " {{{
Plug 'kana/vim-textobj-user' " ...
" }}}

" Text objects " {{{
Plug 'glts/vim-textobj-comment'               " ...
Plug 'kana/vim-textobj-entire'                " ...
Plug 'kana/vim-textobj-function'              " ...
Plug 'kana/vim-textobj-indent'                " ...
Plug 'kana/vim-textobj-line'                  " ...
Plug 'sgur/vim-textobj-parameter'             " ...
Plug 'thinca/vim-textobj-function-javascript' " ...
Plug 'whatyouhide/vim-textobj-xmlattr'        " ...
Plug 'wellle/targets.vim'                     " ...
" }}}

" Create operators " {{{
" Plug 'kana/vim-operator-user' " ...
" " }}}

" Operators " {{{
Plug 'tommcdo/vim-lion'     " ...
Plug 'tpope/vim-commentary' " ...
Plug 'tpope/vim-surround'   " TODO: Replace with machakann/vim-sandwich
" }}}

" Text editing ex commands " {{{
Plug 'AndrewRadev/sideways.vim'    " ...
Plug 'tek/vim-fieldtrip'           " ...
Plug 'tpope/vim-abolish'           " ...
" }}}

" Completion " {{{
Plug 'lifepillar/vim-mucomplete' " ...
" }}}

" Directory viewer " {{{
Plug 'justinmk/vim-dirvish'        " ...
" }}}

" Fuzzy finder " {{{
Plug '/usr/local/opt/fzf' " ...
Plug 'junegunn/fzf.vim'   " ...
" }}}

" Other " {{{
Plug 'AndrewRadev/inline_edit.vim'                  " ...
Plug 'Asheq/close-buffers.vim', { 'branch': 'bang'} " ...
Plug 'kana/vim-submode'                             " ...
Plug 'luochen1990/rainbow'                          " ...
Plug 'machakann/vim-highlightedyank'                " ...
Plug 'mbbill/undotree'                              " ...
Plug 'romainl/vim-qf'                               " ...
Plug 'sgur/vim-editorconfig'                        " ...
Plug 'tpope/vim-apathy'                             " TODO: Replace with language-specific plugins
Plug 'tpope/vim-characterize'                       " ...
Plug 'tpope/vim-eunuch'                             " ...
Plug 'tpope/vim-fugitive'                           " ...
Plug 'tpope/vim-repeat'                             " ...
Plug 'tpope/vim-rsi'                                " ...
Plug 'tpope/vim-unimpaired'                         " ...
Plug 'tyru/capture.vim'                             " 👍 GH Issues: 0
Plug 'tyru/open-browser.vim'                        " 👍 GH Issues: 8
Plug 'wellle/visual-split.vim'                      " ...
" }}}

" Classic vim only {{{
if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults' " ...
endif
" }}}

call plug#end() " Automatically executes 'filetype plugin indent on' and 'syntax enable'.

" vim: fdm=marker
