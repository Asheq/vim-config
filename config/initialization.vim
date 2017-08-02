" initialization.vim

" Compatibility {{{
  " Use Vim (not Vi) settings. Must be first.
  set nocompatible

  " Reset all options to default values instead of values that might have been set by the global
  " config file, /etc/vimrc
  set all&
" }}}

" Augment Runtimepath for Windows {{{
  if has('win32')
    set rtp+=~/.vim
  endif
" }}}

" vim: fdm=marker
