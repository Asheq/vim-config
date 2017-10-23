" vimrc

function s:source_file(path) abort
    if has('win32') || has ('win64')
        let vimhome = "/vimfiles"
    else
        let vimhome = "/.vim"
    endif
   execute 'source' fnameescape(expand('$HOME') . vimhome . '/vimrc-parts/' . a:path)
endfunction

" Settings
let g:asheq#settings = {}
let g:asheq#settings.cache_dir = '~/.vim_cache_dir'
let g:asheq#settings.pretty_chars = 1
let g:asheq#settings.no_gui_scrollbars = 0
let g:asheq#settings.render_gui_with_directx = 0

" Source external script files
call s:source_file('options.vim')
call s:source_file('mappings.vim')
call s:source_file('plugin-list.vim')
call s:source_file('plugin-configuration.vim')
call s:source_file('denite-menus.vim')
