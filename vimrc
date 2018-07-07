let s:path_prefix = fnameescape(expand('$HOME') . '/.vim/vimrc-parts/')

function! s:source(path_suffix) abort
   execute 'source' s:path_prefix . a:path_suffix
endfunction

call s:source('classic-vim-options.vim')
call s:source('gui-options.vim')
call s:source('options.vim')
call s:source('autocmds.vim')
call s:source('disable-plugins.vim')
call s:source('enable-plugins.vim')
call s:source('configure-plugins.vim')
call s:source('commands.vim')
call s:source('mappings/normal-visual-operator.vim')
call s:source('mappings/insert-command-line.vim')
call s:source('mappings/terminal.vim')
