" TODO-WAIT: Create gist. Get feedback.

" :RemoveEmptyLines -keep {{{
command! -bar -nargs=? -range=% -complete=custom,s:RemoveCompletionOptions
      \ RemoveEmptyLines <line1>,<line2>call s:RemoveEmptyLines(<f-args>)

function! s:RemoveEmptyLines(...) range abort
  if a:0
    " Keep one line
    execute a:firstline . ',' . a:lastline . 's/\n\{3,}/\r\r/e'
  else
    " Remove every empty line
    execute a:firstline . ',' . a:lastline . 's/\n\{2,}/\r/e'
  endif
endfunction
" }}}

" :RemoveCommentedLines {{{
command! -bar -nargs=0 -range=%
      \ RemoveCommentedLines <line1>,<line2>call s:RemoveCommentedLines()

function! s:RemoveCommentedLines() range abort
  let comment_regex = '\C\V\^\s\*' . substitute(&commentstring, '\C\V%s', '\\.\\*', '') . '\$'
  execute 'g/' . comment_regex . '/d'
endfunction

function! s:RemoveCompletionOptions(A,L,P) abort
  return "-keep"
endfunction
" }}}

" :StripTrailingWhitespace -confirm {{
command! -nargs=? -range=% -complete=custom,s:StripCompletionOptions
      \ StripTrailingWhitespace <line1>,<line2>call s:StripTrailingWhitespace(<f-args>)

function! s:StripTrailingWhitespace(...) abort
  let confirm = a:0
  execute a:firstline . ',' . a:lastline . 's/\s\+$//e' . (confirm ? 'c' : '')
endfunction

function! s:StripCompletionOptions(A,L,P) abort
  return "-confirm"
endfunction
" }}}

" vim: fdm=marker
