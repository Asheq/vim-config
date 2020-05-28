" Add third-party plugins via vim-plug
" ============================================================================
call plug#begin('~/.vim/plugged')

" Operators
" ----------------------------------------------------------------------------
Plug 'arthurxavierx/vim-caser'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Text objects
" ----------------------------------------------------------------------------
Plug 'kana/vim-textobj-user' " Utility to create text objects.
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'wellle/targets.vim'
Plug 'whatyouhide/vim-textobj-xmlattr'

" Motions
" ----------------------------------------------------------------------------
Plug 'jeetsukumaran/vim-indentwise'

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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tyru/open-browser.vim'
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
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'

" Miscellaneous
" ----------------------------------------------------------------------------
Plug '907th/vim-auto-save'
Plug 'Asheq/close-buffers.vim'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tyru/capture.vim'

""
" plug#end() automatically executes:
"   - 'filetype plugin indent on'
"   - 'syntax enable'
""
call plug#end()

" Add first-party plugins (those included in vim distro)
" ============================================================================
packadd cfilter