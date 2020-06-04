" Operators
Plug 'arthurxavierx/vim-caser'

" Motions
Plug 'haya14busa/vim-edgemotion'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'kana/vim-textobj-line'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'whatyouhide/vim-textobj-xmlattr'

" Text editing Ex commands
Plug 'tpope/vim-abolish'

" Integrations with external GUIs
Plug 'KabbAmine/vCoolor.vim'
Plug 'tyru/open-browser.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'tpope/vim-rhubarb'

" Mappings
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" Other
Plug 'tpope/vim-characterize'
Plug 'Asheq/vim-smooth-scroll'
Plug 'junegunn/goyo.vim'
Plug 'romainl/vim-qf'
Plug 'tyru/capture.vim'
Plug '907th/vim-auto-save'
Plug 'mbbill/undotree'
Plug 'AndrewRadev/bufferize.vim'
Plug 'AndrewRadev/whitespaste.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/deleft.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/quickpeek.vim'

" Buffer/window/tab management
Plug 'AndrewRadev/inline_edit.vim'
Plug 'wellle/visual-split.vim'

" Classic vim only
" ----------------------------------------------------------------------------
if !has('nvim')
    Plug 'noahfrederick/vim-neovim-defaults'
endif
