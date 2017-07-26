" remove-lines.vim
" :RemoveCommentedLines and :RemoveRepeatedEmptyLines

" TODO-HIGH: Turn into commands that take a range where the default range is %

command! RemoveCommentedLines call s:RemoveCommentedLines()
command! RemoveRepeatedEmptyLines call s:RemoveRepeatedEmptyLines()

function! s:RemoveRepeatedEmptyLines()
    %s/\n\{3,}/\r\r/e
endfunction

function! s:RemoveCommentedLines()
    let comment_regex = '\m\C\V\^\s\*' . substitute(&commentstring, '\m\C\V%s', '\\.\\*', '') . '\$'
    execute 'g/' . comment_regex . '/d'
endfunction

