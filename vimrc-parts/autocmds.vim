autocmd StdinReadPost * :set buftype=nofile       " treat buffers from stdin (e.g.: echo foo | vim -) as scratch

autocmd VimResized * :wincmd =                    " resize splits when the window is resized

autocmd VimEnter * call SetStatusline()           " give noscrollbar plugin a chance to define its functions before setting the statusline

autocmd GUIEnter * simalt ~x                      " open GUI maximized

autocmd VimEnter * : call SetITermCursorMode(0)
autocmd VimLeave * : call SetITermCursorMode(1)
autocmd CmdlineLeave * : call SetITermCursorMode(0)
autocmd CmdlineEnter * : call SetITermCursorMode(1)
