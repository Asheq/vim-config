let s:path = fnameescape(expand('$HOME') . '/.vim/vimrc-parts/')

function s:source(file) abort
   execute 'source' s:path . a:file
endfunction

call s:source('options.vim')
call s:source('autocmds.vim')
call s:source('normal-and-visual-mode-mappings.vim')
call s:source('insert-mode-mappings.vim')
call s:source('standard-plugins.vim')
call s:source('additional-plugins.vim')
call s:source('plugin-configuration.vim')
