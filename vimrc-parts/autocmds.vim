autocmd StdinReadPost * :set buftype=nofile       " treat buffers from stdin (e.g.: echo foo | vim -) as scratch

autocmd VimResized * :wincmd =                    " resize splits when the window is resized

" Don't show cursorline while in insert mode, nor in non-active windows
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

autocmd VimLeave * execute ':silent mksession! ' . vimrc#get_cache_dir('sessions') . '/temp'
