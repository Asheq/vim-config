" TODO: Release on github

command! -nargs=0 -range=% Format <line1>,<line2>call s:Format()
function! s:Format() range abort
  if !exists('b:formatprogram')
    echon 'Cannot format since b:formatprogram is not set'
    return
  endif
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
