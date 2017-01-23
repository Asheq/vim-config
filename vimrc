" vim: fdm=marker ts=2 sts=2 sw=2

function s:source_file(path) abort
  execute 'source' fnameescape(expand('$HOME/.vim').'/config/'.a:path)
endfunction

" Source scripts
call s:source_file('init.vim') " good
call s:source_file('util.vim') " good
call s:source_file('general.vim') " good
call s:source_file('mappings.vim')
call s:source_file('plugins/add.vim')
call s:source_file('plugins/configure.vim')
call s:source_file('plugins/mappings.vim')
