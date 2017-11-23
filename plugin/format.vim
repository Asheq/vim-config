" format.vim

" TODO: Add an operator

command! -nargs=0 -range=% Format <line1>,<line2>call s:Format()

function! s:Format() range abort
  " Set Vim's current working directory to directory of current buffer.
  " This makes it so that things like an --editorconfig flag works correctly.
  cd %:p:h

  let cmd = [
        \ '!',
        \ b:formatprogram,
        \ ]
  execute a:firstline . ',' . a:lastline . join(cmd)

  " Reset Vim's current working directory
  cd -
endfunction
