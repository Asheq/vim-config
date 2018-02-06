augroup MyVimrc
  autocmd!
augroup END

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd MyVimrc VimEnter * let g:startuptime = reltime(g:startuptime) | echomsg 'startuptime: ' . reltimestr(g:startuptime)
endif

function s:source_file(path) abort
   execute 'source' fnameescape(expand('$HOME') . '/.vim/vimrc-parts/' . a:path)
endfunction

" Settings
let g:asheq#settings = {}
let g:asheq#settings.cache_dir = '~/.vim_cache_dir'
let g:asheq#settings.pretty_chars = 1
let g:asheq#settings.smooth_scroll = 1
let g:asheq#settings.sneak_overwin = 0

" Source external script files
call s:source_file('options.vim')
call s:source_file('autocmds.vim')
call s:source_file('normal-and-visual-mode-mappings.vim')
call s:source_file('insert-mode-mappings.vim')
call s:source_file('standard-plugins.vim')
call s:source_file('additional-plugins.vim')
call s:source_file('plugin-configuration.vim')
