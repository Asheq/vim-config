" TODO: Determine if this is necessary in neovim
" Explicitly disable or enable standard plugins, i.e. plugins included with Vim under $VIMRUNTIME
let g:loaded_2html_plugin      = 1 "plugin/tohtml.vim
let g:loaded_getscript         = 1 "autoload/getscript.vim
let g:loaded_getscriptPlugin   = 1 "plugin/getscriptPlugin.vim
let g:loaded_gzip              = 1 "plugin/gzip.vim
let g:loaded_logiPat           = 1 "plugin/logiPat.vim
let g:loaded_logipat           = 1 "plugin/logiPat.vim
" let g:loaded_matchparen        = 1 "plugin/matchparen.vim
let g:loaded_netrw             = 1 "autoload/netrw.vim
let g:loaded_netrwFileHandlers = 1 "autoload/netrwFileHandlers.vim
let g:loaded_netrwPlugin       = 1 "plugin/netrwPlugin.vim
let g:loaded_netrwSettings     = 1 "autoload/netrwSettings.vim
let g:loaded_rrhelper          = 1 "plugin/rrhelper.vim
let g:loaded_spellfile_plugin  = 1 "plugin/spellfile.vim
let g:loaded_sql_completion    = 1 "autoload/sqlcomplete.vim
let g:loaded_syntax_completion = 1 "autoload/syntaxcomplete.vim
let g:loaded_tar               = 1 "autoload/tar.vim
let g:loaded_tarPlugin         = 1 "plugin/tarPlugin.vim
let g:loaded_vimball           = 1 "autoload/vimball.vim
let g:loaded_vimballPlugin     = 1 "plugin/vimballPlugin.vim
let g:loaded_zip               = 1 "autoload/zip.vim
let g:loaded_zipPlugin         = 1 "plugin/zipPlugin.vim
let g:vimsyn_embed             = 1 "syntax/vim.vim

" Add matchit plugin
if !has('nvim')
  packadd! matchit
endif
