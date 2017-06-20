" vimrc

function s:source_file(path) abort
  execute 'source' fnameescape(expand('$HOME') . '/.vim/config/' . a:path)
endfunction

call s:source_file('init.vim')
call s:source_file('util.vim')
call s:source_file('options.vim')
call s:source_file('mappings.vim')
call s:source_file('addPlugins.vim')
call s:source_file('configurePlugins.vim')
call s:source_file('deniteMenus.vim')
call s:source_file('colors.vim')
