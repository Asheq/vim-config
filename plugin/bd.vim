command! BD call s:BD()

" TODO: Recreate confirm bd dialog and silence the bd always
function! s:BD()
  if &modified
    confirm bd
  else
    silent bd
  endif
endfunction
