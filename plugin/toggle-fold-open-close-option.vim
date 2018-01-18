command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()

function! s:ToggleFoldOpenCloseStrategy()
  if (&foldopen == 'all')
    set foldopen& foldclose&
    echo 'manual'
  else
    set foldopen=all foldclose=all
    echo 'auto'
  endif
endfunction
