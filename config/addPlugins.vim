" vim: fdm=marker

" *** = plugins from https://www.vi-improved.org/plugins/

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
    " Plug 'ludovicchabant/vim-gutentags' " ***
    " Plug 'mbbill/undotree' " ***
    " Plug 'tommcdo/vim-lion' " ***
    " Plug 'tomtom/ttags_vim' " ***
    " Plug 'wellle/targets.vim' " ***
    Plug 'Konfekt/FastFold'
    Plug 'ajh17/VimCompletesMe' " ***
    Plug 'editorconfig/editorconfig-vim'
    Plug 'gcavallanti/vim-noscrollbar'
    Plug 'justinmk/vim-dirvish' " ***
    Plug 'justinmk/vim-gtfo'
    Plug 'justinmk/vim-sneak' " ***
    Plug 'moll/vim-bbye'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'romainl/vim-qf' " ***
    Plug 'romainl/vim-qlist' " ***
    Plug 'rstacruz/vim-closer'
    Plug 'tyru/open-browser.vim'
    Plug 'vim-scripts/matchit.zip'
  " }}}

endif " }}}

if count(g:asheq#plugin_groups, 'web') " {{{
  " Plug 'mattn/emmet-vim'
endif " }}}

if count(g:asheq#plugin_groups, 'javascript') " {{{
  " Plug 'marijnh/tern_for_vim'
  " TODO: Replace jsbeautify plugin with command line version (and use gq)
  Plug 'maksimr/vim-jsbeautify'
endif " }}}

if count(g:asheq#plugin_groups, 'colors') " {{{
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'chriskempson/base16-vim'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'gosukiwi/vim-atom-dark'
  Plug 'jonathanfilip/vim-lucius'
  Plug 'reedes/vim-colors-pencil'
  Plug 'sjl/badwolf'
  Plug 'tomasr/molokai'
  Plug 'zefei/simple-dark'
  Plug 'zeis/vim-kolor'
endif " }}}

" End {{{
  " Initialize plugin system - automatically executes 'filetype plugin indent on' and 'syntax enable'
  call plug#end()

  " NOTE: Color-related things need to come after call to plug#end

  " Customize colors {{{
    " Reference: https://gist.github.com/hkmix/41492855c3fcc7a9393b
    " TODO: Make performant (remove underlying regexes), comprehensive, simple
    set background=dark
    colorscheme kolor

    noremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

    " Syntax highlighting (other color-groups using default, see :help group-name): {{{
      hi Comment         cterm=NONE ctermfg=NONE gui=NONE guifg=#a080ea
      hi Todo            cterm=NONE ctermfg=NONE gui=NONE guifg=#a080ea
      hi vimCommentTitle cterm=NONE ctermfg=NONE gui=NONE guifg=#a080ea
      hi Constant        cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Identifier      cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Function        cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Statement       cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi PreProc         cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Type            cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Special         cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Delimiter       cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Title           cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi htmlEndTag      cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Keyword         cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Underlined      cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi htmlTagN        cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi String          cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi Number          cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
      hi PreProc         cterm=NONE ctermfg=NONE gui=NONE guifg=NONE
    " }}}

  " }}}

" }}}
