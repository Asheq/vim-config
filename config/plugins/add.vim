" vim: fdm=marker

" *** = plugins from https://www.vi-improved.org/plugins/

" TODO: Lazy load plugins where possible

" Begin {{{
  " Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
  call plug#begin('~/.vim/plugged')
" }}}

if count(g:asheq#plugin_groups, 'general') " {{{

  " Text Objects and Motions {{{
    Plug 'chaoren/vim-wordmotion'
    Plug 'kana/vim-textobj-entire'
    Plug 'kana/vim-textobj-function'
    Plug 'kana/vim-textobj-indent'
    Plug 'kana/vim-textobj-line'
    Plug 'kana/vim-textobj-user'
    Plug 'sgur/vim-textobj-parameter'
    Plug 'thinca/vim-textobj-function-javascript'
  " }}}

  " Denite {{{
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/neomru.vim'
    Plug 'osyo-manga/unite-filetype'
  " }}}

  " Tim Pope {{{
    " Plug 'tpope/vim-characterize' " ***
    " Plug 'tpope/vim-eunuch' " ***
    " Plug 'tpope/vim-fugitive' " ***
    Plug 'tpope/vim-abolish' " ***
    Plug 'tpope/vim-commentary' " ***
    Plug 'tpope/vim-repeat' " ***
    Plug 'tpope/vim-rsi' " ***
    Plug 'tpope/vim-surround' " ***
    Plug 'tpope/vim-unimpaired' " ***
  " }}}

  " Other {{{
    " Plug 'ajh17/VimCompletesMe' " ***
    " Plug 'ludovicchabant/vim-gutentags' " ***
    " Plug 'mbbill/undotree' " ***
    " Plug 'romainl/vim-qf' " ***
    " Plug 'romainl/vim-qlist' " ***
    " Plug 'tommcdo/vim-lion' " ***
    " Plug 'tomtom/ttags_vim' " ***
    " Plug 'wellle/targets.vim' " ***
    Plug 'Konfekt/FastFold'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'gcavallanti/vim-noscrollbar'
    Plug 'justinmk/vim-dirvish' " ***
    Plug 'justinmk/vim-gtfo'
    Plug 'justinmk/vim-sneak' " ***
    Plug 'moll/vim-bbye'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'rstacruz/vim-closer'
    Plug 'tyru/open-browser.vim'
    Plug 'vim-scripts/matchit.zip'
  " }}}

endif " }}}

if count(g:asheq#plugin_groups, 'web') "{{{

  " HTML {{{
    " Plug 'mattn/emmet-vim'
    " Plug 'mustache/vim-mustache-handlebars'
    Plug 'alvan/vim-closetag'
    Plug 'gregsexton/MatchTag'
    Plug 'othree/html5.vim'
  " }}}

  " CSS {{{
    Plug 'ap/vim-css-color'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'groenewege/vim-less'
    Plug 'hail2u/vim-css3-syntax'
  " }}}

endif " }}}

if count(g:asheq#plugin_groups, 'javascript') "{{{
  Plug 'elzr/vim-json'
  Plug 'maksimr/vim-jsbeautify'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  " Plug 'marijnh/tern_for_vim'
endif " }}}

if count(g:asheq#plugin_groups, 'colors') "{{{
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'chriskempson/base16-vim'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'crusoexia/vim-monokai'
  Plug 'google/vim-colorscheme-primary'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'sjl/badwolf'
  Plug 'tomasr/molokai'
  Plug 'zeis/vim-kolor'
endif " }}}

" End {{{
  " Initialize plugin system - automatically executes 'filetype plugin indent on' and 'syntax enable'
  call plug#end()

  " Needs to come after call to plug#end
  colorscheme kolor
  set background=dark
" }}}
