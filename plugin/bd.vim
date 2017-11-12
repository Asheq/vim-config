command! BD call s:BD()

function! s:BD()
  if &modified
  " TODO: Recreate confirm bd dialog and silence the bd afterwards
    confirm bd
  else
    silent bd
  endif
endfunction
