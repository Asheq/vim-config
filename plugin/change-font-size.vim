" change-font-size.vim
" :DecreaseFontSize and :IncreaseFontSize

command! -nargs=1 DecreaseFontSize call s:DecreaseFontSize(<f-args>)
command! -nargs=1 IncreaseFontSize call s:IncreaseFontSize(<f-args>)

function! s:DecreaseFontSize(amount) abort
  call s:ChangeFontSize('-'.a:amount)
endfunction

function! s:IncreaseFontSize(amount) abort
  call s:ChangeFontSize('+'.a:amount)
endfunction

function! s:ChangeFontSize(delta) abort
  let new_font = substitute(&guifont,'\m\C\v(\d+)','\=submatch(0)'.a:delta,'')
  if has('nvim')
    execute 'GuiFont ' . new_font
  else
    execute 'set gfn=' . new_font
  endif
endfunction

