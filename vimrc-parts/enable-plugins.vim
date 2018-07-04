" TODO: Review all plugins.

if !has('nvim')
  packadd! matchit
endif

call plug#begin('~/.vim/plugged')

" MOTIONS:
Plug 'justinmk/vim-sneak'        " ...
Plug 'haya14busa/vim-edgemotion' " ...

" CREATE TEXT OBJECTS:
Plug 'kana/vim-textobj-user' " ...

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'               " ...
Plug 'kana/vim-textobj-entire'                " ...
Plug 'kana/vim-textobj-function'              " ...
Plug 'kana/vim-textobj-indent'                " ...
Plug 'kana/vim-textobj-line'                  " ...
Plug 'sgur/vim-textobj-parameter'             " ...
Plug 'thinca/vim-textobj-function-javascript' " ...
Plug 'whatyouhide/vim-textobj-xmlattr'        " ...
Plug 'wellle/targets.vim'                     " ...

" CREATE OPERATORS:
" Plug 'kana/vim-operator-user' " ...

" OPERATORS:
Plug 'tommcdo/vim-lion'     " ...
Plug 'tpope/vim-commentary' " ...
Plug 'tpope/vim-surround'   " TODO: Replace with machakann/vim-sandwich

" TEXT EDITING EX COMMANDS:
Plug 'AndrewRadev/sideways.vim'    " ...
Plug 'tek/vim-fieldtrip'           " ...
Plug 'tpope/vim-abolish'           " ...

" COLORS:{{{
Plug 'NLKNguyen/papercolor-theme'       " ...
Plug 'jacoborus/tender.vim'             " ...
"}}}
" COMPLETION:
Plug 'lifepillar/vim-mucomplete' " ...

" DIRECTORY VIEWER:
Plug 'justinmk/vim-dirvish'        " ...

" FUZZY FINDER:
Plug '/usr/local/opt/fzf' " ...
Plug 'junegunn/fzf.vim'   " ...

" OTHER:
Plug 'AndrewRadev/inline_edit.vim'                  " ...
Plug 'Asheq/close-buffers.vim', { 'branch': 'bang'} " ...
Plug 'kana/vim-submode'                             " ...
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

call plug#end() " Automatically executes 'filetype plugin indent on' and 'syntax enable'.

" vim: fdm=marker
