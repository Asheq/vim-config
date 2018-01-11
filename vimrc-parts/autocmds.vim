autocmd StdinReadPost * :set buftype=nofile       " treat buffers from stdin (e.g.: echo foo | vim -) as scratch

autocmd VimResized * :wincmd =                    " resize splits when the window is resized

" Don't show cursorline while in insert mode, nor in non-active windows
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
