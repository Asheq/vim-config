if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal nospell
setlocal cursorline
nmap <buffer> i o
