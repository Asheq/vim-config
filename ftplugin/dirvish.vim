if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal nospell
nnoremap <silent> <buffer> <localleader>l :Dirvish ~<CR>
nnoremap <silent> <buffer> <localleader>L :Dirvish /<CR>
nnoremap <silent> <buffer> <localleader>w :Dirvish /cygdrive/c/Users/$USER<CR>
nnoremap <silent> <buffer> <localleader>W :Dirvish /cygdrive/c<CR>
nnoremap <silent> <buffer> <localleader>d :Dirvish /cygdrive/c/Development/GE<CR>
