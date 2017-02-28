" vim: fdm=marker

" Initialize {{{
  " Use Vim (not Vi) settings. Must be first.
  set nocompatible

  " Reset all options to default values
  set all&
" }}}

" Augment runtimepath {{{
  if has('win32')
    set rtp+=~/.vim
    if has('nvim')
      set rtp+=C:\Software\Neovim-Qt\share\nvim-qt\runtime
    endif
  endif
" }}}

" Settings {{{
  let g:asheq#settings = {}
  let g:asheq#settings.auto_center = 0
  let g:asheq#settings.cache_dir = '~/.vim/.cache'
  let g:asheq#settings.render_with_directx = 0
  let g:asheq#settings.scrollbars = 0
  let g:asheq#settings.cool_chars = 1
" }}}

" Plugin Groups {{{
  let g:asheq#plugin_groups = []
  call add(g:asheq#plugin_groups, 'general')
  call add(g:asheq#plugin_groups, 'colors')
  call add(g:asheq#plugin_groups, 'web')
  call add(g:asheq#plugin_groups, 'javascript')
" }}}

" Map leader {{{
  let g:mapleader = "\<Space>"
" }}}
