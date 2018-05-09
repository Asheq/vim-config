if !has('nvim')
  packadd! matchit
endif

call plug#begin('~/.vim/plugged')

" CREATE TEXT OBJECTS:
Plug 'kana/vim-textobj-user' " TODO: yi<text-object> clobbers '< and '> marks (which causes gv not to work as expected)

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
Plug 'wellle/targets.vim' " TODO: causes occasional flickering

" OPERATORS:
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'

" MOTIONS:
Plug 'easymotion/vim-easymotion' " TODO: replace (with sneak?)

" EX COMMANDS:
Plug 'Asheq/close-buffers.vim'
Plug 'tyru/capture.vim'
Plug 'tpope/vim-eunuch'

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
Plug 'junegunn/fzf.vim' " TODO: cursor flicker on opening fzf window

" COLORS:
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'

" WISH LIST:
" text objects
" ----------------------
" adriaanzon/vim-textobj-matchit
" Julian/vim-textobj-variable-segment
" saihoooooooo/vim-textobj-space or zandrmartin/vim-textobj-blanklines

" miscellaneous plugins
" ----------------------
" kana/vim-submode
" troydm/zoomwintab.vim
" haya14busa/vim-easyoperator-line
" haya14busa/vim-edgemotion
" AndrewRadev/switch.vim
" AndrewRadev/sideways.vim
" chrisbra/vim-diff-enhanced
" christoomey/vim-tmux-navigator
" scrooloose/nerdtree
" dyng/ctrlsf.vim
" Very simple auto-pair plugin
" HTML tag pair plugin
" Emmet for writing HTML

" coding
" ----------------------
" Language server protocol?
" Quick info under cursor
" Goto definition under cursor
" Completions
" Syntax checking
" more?

" tag plugins
" ----------------------
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'

call plug#end() " automatically calls 'filetype plugin indent on' and 'syntax enable'

" vim: fdm=marker
