let s:matches_str=".fa-lg .fa-lg .fa-2x .fa-3x .fa-4x .fa-5x .fa-fw .fa-ul .fa-ul .fa-li .fa-li.fa-lg .fa-border .fa-pull-left .fa-pull-right .fa.fa-pull-left"
let s:matches = split(s:matches_str)

function! csscomplete#CompleteFA(findstart, base)
    if a:findstart
        " Locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && (line[start - 1] =~ '\a' || line[start - 1] == '.' || line[start - 1] == '-')
            let start -= 1
        endwhile
        return start
    else
        " Find classes matching "a:base"
        let res = []
        for m in s:matches
            if m =~ '^' . a:base
                call add(res, { 'word': m, 'menu': 'CSS class', 'info': 'A font-awesome CSS class: ' . m, 'kind': 'm'})
            endif
        endfor
        return res
    endif
endfun
