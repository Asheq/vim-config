" TODO: Review all plugins.

if !has('nvim')
  packadd! matchit
endif

call plug#begin('~/.vim/plugged')

" CREATE TEXT OBJECTS:
Plug 'kana/vim-textobj-user' " ...

" CREATE OPERATORS:
" Plug 'kana/vim-operator-user' " ...

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'                          " ...
Plug 'kana/vim-textobj-entire'                           " ...
Plug 'kana/vim-textobj-function'                         " ...
Plug 'kana/vim-textobj-indent'                           " ...
Plug 'kana/vim-textobj-line'                             " ...
Plug 'sgur/vim-textobj-parameter'                        " ...
Plug 'thinca/vim-textobj-function-javascript'            " ...
Plug 'whatyouhide/vim-textobj-xmlattr'                   " ...
Plug 'wellle/targets.vim'                                " ...

" OPERATORS:
Plug 'tommcdo/vim-lion'     " ...
Plug 'tpope/vim-commentary' " ...
Plug 'tpope/vim-surround'   " ...

" MOTIONS:
Plug 'justinmk/vim-sneak' " ...

" DIRECTORY VIEWER:
Plug 'justinmk/vim-dirvish' " ...

" COMPLETION:
Plug 'lifepillar/vim-mucomplete' " ...

" FUZZY FINDER:
Plug '/usr/local/opt/fzf' " ...
Plug 'junegunn/fzf.vim'   " ...

" COLORS:
Plug 'jacoborus/tender.vim'       " ...
Plug 'NLKNguyen/papercolor-theme' " ...
Plug 'freeo/vim-kalisi'           " ...

" OTHER:
Plug 'tyru/capture.vim'            " 👍 GH Issues: 0
Plug 'tyru/open-browser.vim'       " 👍 GH Issues: 8
Plug 'AndrewRadev/inline_edit.vim' " ...
Plug 'Asheq/close-buffers.vim'     " ...
Plug 'Konfekt/FastFold'            " ...
Plug 'mbbill/undotree'             " ...
Plug 'sgur/vim-editorconfig'       " ...
Plug 'tpope/vim-abolish'           " ...
Plug 'tpope/vim-characterize'      " ...
Plug 'tpope/vim-eunuch'            " ...
Plug 'tpope/vim-fugitive'          " ...
Plug 'tpope/vim-repeat'            " ...
Plug 'tpope/vim-rsi'               " ...
Plug 'tpope/vim-unimpaired'        " ...
Plug 'wellle/visual-split.vim'     " ...
Plug 'romainl/vim-qf'              " ...

call plug#end() " Automatically executes 'filetype plugin indent on' and 'syntax enable'.

" vim: fdm=marker
