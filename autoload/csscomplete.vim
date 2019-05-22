let s:classlist_str=".fa-lg .fa-lg .fa-2x .fa-3x .fa-4x .fa-5x .fa-fw .fa-ul .fa-ul .fa-li .fa-li.fa-lg .fa-border .fa-pull-left .fa-pull-right .fa.fa-pull-left"
let s:classlist = split(s:classlist_str)

function! csscomplete#CompleteFA(findstart, base)
    if a:findstart
        " Locate the start column of the word to match
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && (line[start - 1] =~ '\a' || line[start - 1] == '.' || line[start - 1] == '-')
            let start -= 1
        endwhile
        return start
    else
        " Find classes matching a:base
        let matches = []
        for c in s:classlist
            if c =~ '^' . a:base
                call add(matches, { 'word': c, 'menu': 'CSS class', 'info': 'CSS class from font-awesome: ' . c, 'kind': 'v'})
            endif
        endfor
        return matches
    endif
endfun
