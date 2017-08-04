" vimrc

" TODO-LOW: set foldmethod=indent for plain text files

function s:source_file(path) abort
   execute 'source' fnameescape(expand('$HOME') . '/.vim/config/' . a:path)
endfunction

call s:source_file('initialization.vim')
call s:source_file('settings.vim')
call s:source_file('functions.vim')
call s:source_file('commands.vim')
call s:source_file('options.vim')
call s:source_file('mappings.vim')
call s:source_file('plugin-list.vim')
call s:source_file('plugin-configuration.vim')
call s:source_file('denite-menus.vim')
call s:source_file('colors.vim')
