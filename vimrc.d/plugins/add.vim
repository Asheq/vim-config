" Add third-party plugins via vim-plug
" ============================================================================
call plug#begin('~/.vim/plugged')

" Operators
" ---------------------------------------------------------------------------
Plug 'tommcdo/vim-lion'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'

" Motions
" ----------------------------------------------------------------------------
Plug 'jeetsukumaran/vim-indentwise'

" Text objects
" ----------------------------------------------------------------------------
" [Text objects go here]

" Directory explorer
" ----------------------------------------------------------------------------
Plug 'justinmk/vim-dirvish'

" Integration with git and GitHub
" ----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Integrations with external GUIs
" ----------------------------------------------------------------------------
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Syntax/highlighting
" ----------------------------------------------------------------------------
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'

" Buffer/window/tab management
" ----------------------------------------------------------------------------
Plug 'Asheq/close-buffers.vim'

" Auto-set options
" ----------------------------------------------------------------------------
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-projectionist'

" Experimental
" ----------------------------------------------------------------------------
Plug 'wellle/context.vim'
Plug 'tpope/vim-characterize'

" plug#end() automatically executes:
"   - 'filetype plugin indent on'
"   - 'syntax enable'
call plug#end()

" Add first-party plugins (those included in vim distro)
" ============================================================================
packadd cfilter
