if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal foldmethod=indent
let b:undo_ftplugin = "setlocal foldmethod<"
