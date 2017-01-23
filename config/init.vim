" vim: fdm=marker

" Initialization {{{
  " Use Vim settings, rather than Vi settings (much better!).
  " This must be first, because it changes other options as a side effect.
  set nocompatible

  " Reset all options
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
  let g:asheq#settings.directx_rendering = 0
  let g:asheq#settings.special_chars = 1
" }}}

" Plugin Groups {{{
  let g:asheq#plugin_groups = []
  call add(g:asheq#plugin_groups, 'general')
  call add(g:asheq#plugin_groups, 'colors')
  call add(g:asheq#plugin_groups, 'web')
  call add(g:asheq#plugin_groups, 'javascript')
  if has('win32')
    call add(g:asheq#plugin_groups, 'windows')
  endif
" }}}

" Map leader {{{
  let mapleader = "\<Space>"
  let g:mapleader = "\<Space>"
" }}}

