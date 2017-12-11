autocmd StdinReadPost * :set buftype=nofile       " treat buffers from stdin (e.g.: echo foo | vim -) as scratch

autocmd VimResized * :wincmd =                    " resize splits when the window is resized
