if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

nnoremap <buffer> <silent> <leader>a       :Denite menu:tern_commands<CR>
