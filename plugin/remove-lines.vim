" remove-lines.vim
" TODO: Turn into an operator?
" :RemoveCommentedLines and :RepeatedEmptyLines

command! -bar -nargs=? -range=% -complete=custom,s:CompletionOptions
      \ RemoveEmptyLines <line1>,<line2>call s:RemoveEmptyLines(<f-args>)
command! -bar -nargs=0 -range=%
      \ RemoveCommentedLines <line1>,<line2>call s:RemoveCommentedLines()

function! s:RemoveEmptyLines(...) range abort
  if a:0
    " Keep one line
    execute a:firstline . ',' . a:lastline . 's/\n\{3,}/\r\r/e'
  else
    " Remove every empty line
    execute a:firstline . ',' . a:lastline . 's/\n\{2,}/\r/e'
  endif
endfunction

function! s:RemoveCommentedLines() range abort
  let comment_regex = '\C\V\^\s\*' . substitute(&commentstring, '\C\V%s', '\\.\\*', '') . '\$'
  execute 'g/' . comment_regex . '/d'
endfunction

function! s:CompletionOptions(A,L,P)
  return "-keep"
endfunction
