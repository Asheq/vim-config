command! DiffOrig call s:DiffOrig()
command! DiffOrigAlt call s:DiffOrigAlt()
command! DiffOrigEnd call s:DiffOrigEnd()

function! s:DiffOrig()
  set splitright
  vert new
  set bt=nofile
  r ++edit #
  0d_
  diffthis
  wincmd p
  diffthis
endfunction

function! s:DiffOrigAlt()
  write !diff % -
endfunction

function! s:DiffOrigEnd()
  bdelete | diffoff!
endfunction
