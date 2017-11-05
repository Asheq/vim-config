" plugin-list.vim

" Explicitly enable or disable standard plugins included with Vim
let g:loaded_2html_plugin      = 1 "$VIMRUNTIME/plugin/tohtml.vim
let g:loaded_getscript         = 1 "$VIMRUNTIME/autoload/getscript.vim
let g:loaded_getscriptPlugin   = 1 "$VIMRUNTIME/plugin/getscriptPlugin.vim
let g:loaded_gzip              = 1 "$VIMRUNTIME/plugin/gzip.vim
let g:loaded_logiPat           = 1 "$VIMRUNTIME/plugin/logiPat.vim
let g:loaded_logipat           = 1 "$VIMRUNTIME/plugin/logiPat.vim
" let g:loaded_matchparen        = 1 "$VIMRUNTIME/plugin/matchparen.vim
let g:loaded_netrw             = 1 "$VIMRUNTIME/autoload/netrw.vim
let g:loaded_netrwFileHandlers = 1 "$VIMRUNTIME/autoload/netrwFileHandlers.vim
let g:loaded_netrwPlugin       = 1 "$VIMRUNTIME/plugin/netrwPlugin.vim
let g:loaded_netrwSettings     = 1 "$VIMRUNTIME/autoload/netrwSettings.vim
let g:loaded_rrhelper          = 1 "$VIMRUNTIME/plugin/rrhelper.vim
let g:loaded_spellfile_plugin  = 1 "$VIMRUNTIME/plugin/spellfile.vim
let g:loaded_sql_completion    = 1 "$VIMRUNTIME/autoload/sqlcomplete.vim
let g:loaded_syntax_completion = 1 "$VIMRUNTIME/autoload/syntaxcomplete.vim
let g:loaded_tar               = 1 "$VIMRUNTIME/autoload/tar.vim
let g:loaded_tarPlugin         = 1 "$VIMRUNTIME/plugin/tarPlugin.vim
let g:loaded_vimball           = 1 "$VIMRUNTIME/autoload/vimball.vim
let g:loaded_vimballPlugin     = 1 "$VIMRUNTIME/plugin/vimballPlugin.vim
let g:loaded_zip               = 1 "$VIMRUNTIME/autoload/zip.vim
let g:loaded_zipPlugin         = 1 "$VIMRUNTIME/plugin/zipPlugin.vim
let g:vimsyn_embed             = 1 "$VIMRUNTIME/syntax/vim.vim

" Activate included matchit plugin
packadd! matchit

" Directory for plugins
call plug#begin('~/.vim/plugged')

" Plugins from https://www.vi-improved.org/plugins/
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tomtom/ttags_vim'
" Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-dirvish'
Plug 'mbbill/undotree'
Plug 'romainl/vim-qf'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
" TODO: Replace vim-sneak with easy motion for bi-directional jumping
Plug 'justinmk/vim-sneak'
" TODO: Replace vim-surround with generic operator plugin
Plug 'tpope/vim-surround'

" Text Object and Motion Plugins
" Plug 'glts/vim-textobj-comment'
Plug 'chaoren/vim-wordmotion'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'

" Operators
" Plug 'kana/vim-operator-replace'
" Plug 'rhysd/vim-operator-surround'
Plug 'kana/vim-operator-user'

" Other Plugins
Plug 'Asheq/close-buffers.vim'
Plug 'Konfekt/FastFold'
Plug 'gcavallanti/vim-noscrollbar'
Plug 'haya14busa/vim-operator-flashy'
Plug 'lifepillar/vim-mucomplete'
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'
Plug 'tyru/capture.vim'
Plug 'tyru/open-browser.vim'
Plug 'wellle/visual-split.vim'

" NEED:
" fzf fuzzy finder for everything (buffers, MRU files, project files, arbitrary command menus, etc.)
" Syntax checker
" Git gutter
" Code formatters

" EXTRA:
" Plug 'nathanaelkane/vim-indent-guides' or indent lines
" Snippets
" Ctrlsf and/or Far

" Denite and Sources
" TODO: Replace denite with fzf
Plug 'Shougo/denite.nvim'

" Front-end Plugins
Plug 'ternjs/tern_for_vim', { 'do': 'npm install'}
Plug 'heavenshell/vim-jsdoc'
" Plug 'mattn/emmet-vim'

call plug#end()
" NOTE: 'filetype plugin indent on' and 'syntax enable' are automatically called

" vim: fdm=marker
