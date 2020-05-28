let s:goyo = 0

function! goyo#execute()
  if s:goyo
    call s:goyo_off()
    let s:goyo = 0
  else
    call s:goyo_on()
    let s:goyo = 1
  endif
endfunction

function! s:goyo_off()
  let &laststatus = s:laststatus
  let &showtabline = s:showtabline
  let &number = s:number
  let &ruler = s:ruler
  let &foldcolumn = s:foldcolumn
endfunction

function! s:goyo_on()
  let s:laststatus = &laststatus
  let s:showtabline = &showtabline
  let s:number = &number
  let s:ruler = &ruler
  let s:foldcolumn = &foldcolumn
  set laststatus=0
  set showtabline=0
  set foldcolumn=12
  set nonumber
  set noruler
endfunction
