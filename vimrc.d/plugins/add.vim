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

" Directory explorer
" ----------------------------------------------------------------------------
Plug 'justinmk/vim-dirvish'

" Integration with git and GitHub
" ----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

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

" plug#end() automatically executes:
"   - 'filetype plugin indent on'
"   - 'syntax enable'
call plug#end()

" Add first-party plugins (those included in vim distro)
" ============================================================================
packadd cfilter
