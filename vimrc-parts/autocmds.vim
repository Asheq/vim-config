" TODO: Refactor autocmds
autocmd StdinReadPost * :set buftype=nofile       " treat buffers from stdin (e.g.: echo foo | vim -) as scratch

autocmd VimResized * :wincmd =                    " resize splits when the window is resized

autocmd VimLeave * execute ':silent mksession! ' . vimrc#get_cache_dir('sessions') . '/temp'
