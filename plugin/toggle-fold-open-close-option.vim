command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()

function! s:ToggleFoldOpenCloseStrategy() abort
  if (&foldopen == 'all')
    set foldopen& foldclose&
    echo 'manual fold open/close'
  else
    set foldopen=all foldclose=all
    echo 'auto fold open/close'
  endif
endfunction
