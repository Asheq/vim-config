let s:vimrc_parts_dir = fnameescape(expand('$HOME') . '/.vim/vimrc-parts/')

function! s:source(path_suffix) abort
   execute 'source ' . s:vimrc_parts_dir . a:path_suffix
endfunction

call s:source('set-symbols.vim')
call s:source('disable-plugins.vim')
call s:source('configure-plugins.vim')
call s:source('enable-plugins.vim')
call s:source('neovim-defaults-for-vim.vim')
call s:source('options.vim')
call s:source('commands.vim')
call s:source('mappings/normal-visual-operator.vim')
call s:source('mappings/insert-command-line.vim')
call s:source('mappings/terminal.vim')
call s:source('finalize.vim')
