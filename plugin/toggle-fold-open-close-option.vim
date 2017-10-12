command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()

function! s:ToggleFoldOpenCloseStrategy()
  if (&foldopen == 'all')
    let cmd = ':set foldopen& foldclose&'
  else
    let cmd = ':set foldopen=all foldclose=all'
  endif
  call feedkeys(cmd . "\<CR>")
endfunction
