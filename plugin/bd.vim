command! BD call s:BD()

function! s:BD() abort
  if &modified
    confirm bd
  else
    silent bd
  endif
endfunction
