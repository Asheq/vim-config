" Add third-party plugins via vim-plug
" ============================================================================
call plug#begin('~/.vim/plugged')

" Operators
" ---------------------------------------------------------------------------
Plug 'tommcdo/vim-lion'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'arthurxavierx/vim-caser'

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
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-git'

" Integration with external GUIs
" ----------------------------------------------------------------------------
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Syntax/highlighting
" ----------------------------------------------------------------------------
Plug 'norcalli/nvim-colorizer.lua'
Plug 'machakann/vim-highlightedyank'

" Buffer/window/tab management
" ----------------------------------------------------------------------------
Plug 'Asheq/close-buffers.vim'

" Auto-set options
" ----------------------------------------------------------------------------
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-projectionist'

" Filetype-specific
" ----------------------------------------------------------------------------
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-apathy'

" JavaScript
Plug 'pangloss/vim-javascript'

" TypeScript
Plug 'leafgarland/typescript-vim'

" JSX
Plug 'MaxMEllon/vim-jsx-pretty'

" TSX
Plug 'peitalin/vim-jsx-typescript'

" Other
" ----------------------------------------------------------------------------
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-abolish'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'wellle/context.vim'

" Language Server
" ----------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-eslint'
  \ ]

" plug#end() automatically executes:
"   1. 'filetype plugin indent on'
"   2. 'syntax enable'
call plug#end()

" Add first-party plugins (those included in vim distro)
" ============================================================================
packadd cfilter
