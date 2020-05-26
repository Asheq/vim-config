" vim: fdm=marker

" Add third-party plugins via vim-plug {{{1

" plug#begin {{{2
call plug#begin('~/.vim/plugged')

" Motions {{{2
Plug 'jeetsukumaran/vim-indentwise'

" Text objects {{{2
" TODO Create text objects yourself using the officially endorsed pattern
" https://www.reddit.com/r/vim/comments/frlzt8/create_your_own_text_object/
Plug 'kana/vim-textobj-user'

Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'wellle/targets.vim'

" Operators {{{2
Plug 'arthurxavierx/vim-caser'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
" TODO Replace with machakann/vim-sandwich?
Plug 'tpope/vim-surround'

" Directory explorer {{{2
Plug 'justinmk/vim-dirvish'

" Fuzzy finder {{{2
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Integration with external GUI apps {{{2
Plug 'KabbAmine/vCoolor.vim'
Plug 'tyru/open-browser.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Integration with Git and GitHub {{{2
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'

" Syntax/highlighting {{{2
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'luochen1990/rainbow'
Plug 'machakann/vim-highlightedyank'

" Mappings {{{2
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'haya14busa/vim-asterisk'

" Miscellaneous {{{2
" BOOKMARK
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'mbbill/undotree'
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tyru/capture.vim'
Plug 'wellle/visual-split.vim'
Plug '907th/vim-auto-save'

" To Remove {{{2
" TODO Get rid of flagship and use raw tabline settings.
Plug 'tpope/vim-flagship'

" plug#end {{{2
" NOTE: plug#end() automatically executes 'filetype plugin indent on' and
" 'syntax enable'
call plug#end()

" First-party plugins (included in vim distro) {{{1
packadd cfilter
