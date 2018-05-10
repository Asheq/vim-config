if !has('nvim')
  packadd! matchit
endif

call plug#begin('~/.vim/plugged')

" CREATE TEXT OBJECTS:
Plug 'kana/vim-textobj-user' " TODO: Report issue that yi<text-object> clobbers '< and '> marks (causing gv to behave unexpectedly)

" CREATE OPERATORS:
" Plug 'kana/vim-operator-user'

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'wellle/targets.vim' " TODO: Report occasional flickering

" OPERATORS:
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'

" MOTIONS:
Plug 'easymotion/vim-easymotion' " TODO: Replace (with sneak)

" EX COMMANDS:
Plug 'Asheq/close-buffers.vim'
Plug 'tyru/capture.vim'
Plug 'tpope/vim-eunuch'
Plug 'troydm/zoomwintab.vim'

" FUNCTIONS:
Plug 'gcavallanti/vim-noscrollbar'

" MIXED AND OTHER:
Plug 'AndrewRadev/inline_edit.vim'
Plug 'Konfekt/FastFold'
Plug 'chrisbra/Colorizer'
Plug 'justinmk/vim-dirvish'
Plug 'mbbill/undotree'
Plug 'romainl/vim-qf'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'tyru/open-browser.vim'
Plug 'wellle/visual-split.vim'

" COMPLETIONS:
Plug 'lifepillar/vim-mucomplete'

" FUZZY FINDER:
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim' " TODO: Report cursor flicker on opening fzf window

" COLORS:
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'freeo/vim-kalisi'

call plug#end() " automatically executes 'filetype plugin indent on' and 'syntax enable'

" vim: fdm=marker
