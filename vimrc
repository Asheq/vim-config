"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"

let s:path_prefix = fnameescape(expand('$HOME') . '/.vim/vimrc-parts/')

function s:source(path_suffix) abort
   execute 'source' s:path_prefix . a:path_suffix
endfunction

call s:source('options.vim')
call s:source('autocmds.vim')
call s:source('disable-plugins.vim')
call s:source('enable-plugins.vim')
call s:source('configure-plugins.vim')
call s:source('commands.vim')
call s:source('mappings/normal-and-visual.vim')
call s:source('mappings/insert-and-command-line.vim')
