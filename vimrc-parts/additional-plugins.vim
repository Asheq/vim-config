" TODO: Organize plugins
" Directory for plugins
call plug#begin('~/.vim/plugged')

" [p] = problems (check Github issues)

" CREATE TEXT OBJECTS:
Plug 'kana/vim-textobj-user'           " [p], yi<text-object> clobbers '< and '> marks (which causes gv not to work as expected).

" CREATE OPERATORS:
" Plug 'kana/vim-operator-user'        " [p]

" TEXT OBJECTS:
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'sgur/vim-textobj-parameter'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'wellle/targets.vim'              " [p]

" OPERATORS:
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-surround'              " [p], cursor flicker on dot-repeat of surround command

" MOTIONS:
Plug 'easymotion/vim-easymotion'       " [p] TODO: Replace with a modified sneak

" EX COMMANDS:
Plug 'Asheq/close-buffers.vim'         " [p]
Plug 'tyru/capture.vim'                " [p]
Plug 'tpope/vim-eunuch'                " [p]

" FUNCTIONS:
Plug 'gcavallanti/vim-noscrollbar'     " [p]

" MIXED AND OTHER:
Plug '907th/vim-auto-save'             " [p]
Plug 'chrisbra/Colorizer'              " [p]
Plug 'editorconfig/editorconfig-vim'   " [p]
Plug 'justinmk/vim-dirvish'            " [p]
Plug 'mbbill/undotree'                 " [p]
Plug 'romainl/vim-qf'                  " [p]
Plug 'tomtom/tcomment_vim'             " [p] TODO: Don't create ic and ac text objects
Plug 'tpope/vim-abolish'               " [p]
Plug 'tpope/vim-characterize'          " [p]
Plug 'tpope/vim-fugitive'              " [p]
Plug 'tpope/vim-repeat'                " [p]
Plug 'tpope/vim-rsi'                   " [p]
Plug 'tpope/vim-unimpaired'            " [p]
Plug 'tyru/open-browser.vim'           " [p]
Plug 'wellle/visual-split.vim'         " [p]

" COMPLETIONS:                         " [p]
Plug 'ajh17/VimCompletesMe'

" FUZZY FINDER:
Plug '/usr/local/opt/fzf'              " [p]
Plug 'junegunn/fzf.vim'                " [p], cursor flicker on opening fzf window

" COLORS:
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'

" WISH LIST:
" miscellaneous
" ----------------------
" Improved mappings
" Less flickering and better performance overall

" text objects
" ----------------------
" adriaanzon/vim-textobj-matchit
" Julian/vim-textobj-variable-segment
" saihoooooooo/vim-textobj-space or zandrmartin/vim-textobj-blanklines

" miscellaneous plugins
" ----------------------
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
" Snippets
" Syntax checking
" more?

" tag plugins
" ----------------------
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'

call plug#end() " 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
