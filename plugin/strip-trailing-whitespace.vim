" strip-trailing-whitespace.vim
" TODO: Turn into an operator?
" :StripTrailingWhitespace
" Use -confirm flag to confirm each line

command! -nargs=? -range=% -complete=custom,s:CompletionOptions
      \ StripTrailingWhitespace <line1>,<line2>call s:StripTrailingWhitespace(<f-args>)

function! s:StripTrailingWhitespace(...) abort
  let confirm = a:0
  execute a:firstline . ',' . a:lastline . 's/\s\+$//e' . (confirm ? 'c' : '')
endfunction

function! s:CompletionOptions(A,L,P) abort
  return "-confirm"
endfunction
