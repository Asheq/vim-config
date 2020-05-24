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
" TODO Replace with machakann/vim-sandwich
Plug 'tpope/vim-surround'

" Directory viewer
" ----------------------------------------------------------------------------
Plug 'justinmk/vim-dirvish'

" Fuzzy finder
" ----------------------------------------------------------------------------
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Text editing ex commands
" ----------------------------------------------------------------------------
Plug 'tpope/vim-abolish'

" Visualizing and picking colors
" ----------------------------------------------------------------------------
Plug 'KabbAmine/vCoolor.vim'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Other
" ----------------------------------------------------------------------------
Plug 'AndrewRadev/inline_edit.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'junegunn/goyo.vim'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'mbbill/undotree'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
" TODO Get rid of flagship and use raw tabline settings.
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/capture.vim'
Plug 'tyru/open-browser.vim'
Plug 'wellle/visual-split.vim'
Plug '907th/vim-auto-save'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Git
" ----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'

" Vim colorschemes
" ----------------------------------------------------------------------------
Plug 'tomasiser/vim-code-dark'

" Classic vim only
" ----------------------------------------------------------------------------
if !has('nvim')
  Plug 'noahfrederick/vim-neovim-defaults'
endif

" Neovim only
" ----------------------------------------------------------------------------
if has('nvim')
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

" NOTE: plug#end() automatically executes 'filetype plugin indent on' and
" 'syntax enable'
call plug#end()

" Add plugins included in the vim distribution
" ============================================================================
packadd cfilter
