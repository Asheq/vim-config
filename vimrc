" vim: fdm=marker ts=2 sts=2 sw=2

function s:source_file(path) abort
  execute 'source' fnameescape(expand('$HOME/.vim').'/config/'.a:path)
endfunction

" Source scripts
call s:source_file('init.vim')
call s:source_file('util.vim')
call s:source_file('options.vim')
call s:source_file('mappings.vim')
call s:source_file('addPlugins.vim')
call s:source_file('configurePlugins.vim')
