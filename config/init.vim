" vim: fdm=marker

" Initialize {{{
  " Use Vim (not Vi) settings. Must be first.
  set nocompatible

  " Reset all options to default values
  set all&
" }}}

" Augment Runtimepath for Windows {{{
  if has('win32')
    set rtp+=~/.vim
  endif
" }}}

" Settings {{{
  let g:asheq#settings = {}
  let g:asheq#settings.cache_dir = '~/.vim_cache_dir'
  let g:asheq#settings.pretty_chars = 1
  let g:asheq#settings.no_gui_scrollbars = 0
  let g:asheq#settings.render_gui_with_directx = 0
  let g:asheq#settings.plugin_groups = ['general', 'colors', 'web', 'javascript']
" }}}
