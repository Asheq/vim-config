" vim: fdm=marker

" Add third-party plugins via vim-plug
" ============================================================================
call plug#begin('~/.vim/plugged')

" Motions
" ----------------------------------------------------------------------------
Plug 'jeetsukumaran/vim-indentwise'

" Text objects
" ----------------------------------------------------------------------------
" TODO Create text objects yourself using the officially endorsed pattern
" https://www.reddit.com/r/vim/comments/frlzt8/create_your_own_text_object/
Plug 'kana/vim-textobj-user'

Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'wellle/targets.vim'

" Operators
" ----------------------------------------------------------------------------
Plug 'arthurxavierx/vim-caser'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
" TODO Replace with machakann/vim-sandwich?
Plug 'tpope/vim-surround'

" Directory explorer
" ----------------------------------------------------------------------------
Plug 'justinmk/vim-dirvish'

" Fuzzy finder
" ----------------------------------------------------------------------------
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Integration with external GUI apps
" ----------------------------------------------------------------------------
Plug 'KabbAmine/vCoolor.vim'
Plug 'tyru/open-browser.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
if has('nvim')
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

" Integration with Git and GitHub
" ----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'

" Syntax/highlighting
" ----------------------------------------------------------------------------
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'

" Mappings
" ----------------------------------------------------------------------------
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'haya14busa/vim-asterisk'

" Miscellaneous
" ----------------------------------------------------------------------------
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'mbbill/undotree'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tyru/capture.vim'
Plug 'wellle/visual-split.vim'
Plug '907th/vim-auto-save'

" NOTE: plug#end() automatically executes 'filetype plugin indent on' and
" 'syntax enable'
call plug#end()

" Add first-party plugins (those included in vim distro)
" ============================================================================
packadd cfilter
