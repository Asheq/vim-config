command! BD call s:BD()

function! s:BD()
  if &modified
    confirm bd
  else
    silent bd
  endif
endfunction
