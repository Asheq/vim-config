" Add third-party plugins via vim-plug
" ============================================================================
call plug#begin('~/.vim/plugged')

" Operators
" ----------------------------------------------------------------------------
Plug 'arthurxavierx/vim-caser'
Plug 'machakann/vim-sandwich'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'

" Text objects
" ----------------------------------------------------------------------------
Plug 'kana/vim-textobj-user' " Utility to create text objects.
Plug 'kana/vim-textobj-indent'

" Motions
" ----------------------------------------------------------------------------
Plug 'jeetsukumaran/vim-indentwise'

" Text editing Ex commands
" ----------------------------------------------------------------------------
Plug 'tpope/vim-abolish'

" Directory explorer
" ----------------------------------------------------------------------------
Plug 'justinmk/vim-dirvish'

" Integration with external GUI apps
" ----------------------------------------------------------------------------
Plug 'tyru/open-browser.vim'

" Integration with git and GitHub
" ----------------------------------------------------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Syntax/highlighting
" ----------------------------------------------------------------------------
Plug 'norcalli/nvim-colorizer.lua'
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'

" Mappings
" ----------------------------------------------------------------------------
Plug 'tpope/vim-unimpaired'

" Miscellaneous
" ----------------------------------------------------------------------------
Plug 'Asheq/close-buffers.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-apathy'

" plug#end() automatically executes:
"   - 'filetype plugin indent on'
"   - 'syntax enable'
call plug#end()

" Add first-party plugins (those included in vim distro)
" ============================================================================
packadd cfilter
