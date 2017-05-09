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
  endif
" }}}

" Settings {{{
  let g:asheq#settings = {}
  let g:asheq#settings.cache_dir = '~/.vim/.cache'
  let g:asheq#settings.cool_chars = 1
  let g:asheq#settings.scroll_skip_zb = 1
  let g:asheq#settings.use_cmd = 1

  " GUI {{{
    let g:asheq#settings.no_scrollbars = 0
    let g:asheq#settings.render_with_directx = 0
  " }}}

" }}}

" Plugin Groups {{{
  let g:asheq#plugin_groups = [
        \ 'general',
        \ 'colors',
        \ 'web',
        \ 'javascript'
        \ ]
" }}}
