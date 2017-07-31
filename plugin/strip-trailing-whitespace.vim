" strip-trailing-whitespace.vim
" :StripTrailingWhitespace

command! -nargs=? -range=% -complete=custom,s:CompletionOptions
    \ StripTrailingWhitespace <line1>,<line2>call s:StripTrailingWhitespace(<f-args>)

function! s:StripTrailingWhitespace(...)
    let confirm = a:0
    execute a:firstline . ',' . a:lastline . 's/\s\+$//e' . (confirm ? 'c' : '')
endfunction

function! s:CompletionOptions(A,L,P)
    return "-confirm"
endfunction
