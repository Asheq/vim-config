command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()

function! s:ToggleFoldOpenCloseStrategy()
  if (&foldopen == 'all')
    set foldopen& foldclose&
    echo 'fold manual'
  else
    set foldopen=all foldclose=all
    echo 'fold auto'
  endif
endfunction
