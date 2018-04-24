" TODO: Refactor autocmds
augroup MyVimrc
  autocmd!
augroup END

if has('vim_starting')
  let g:startuptime = reltime()
  autocmd MyVimrc VimEnter * let g:startuptime = reltime(g:startuptime) | echomsg 'startuptime: ' . string(reltimefloat(g:startuptime) * 1000) . ' milliseconds'
endif

function s:source_file(path) abort
   execute 'source' fnameescape(expand('$HOME') . '/.vim/vimrc-parts/' . a:path)
endfunction

call s:source_file('options.vim')
call s:source_file('autocmds.vim')
call s:source_file('normal-and-visual-mode-mappings.vim')
call s:source_file('insert-mode-mappings.vim')
call s:source_file('standard-plugins.vim')
call s:source_file('additional-plugins.vim')
call s:source_file('plugin-configuration.vim')
