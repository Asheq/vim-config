" See :help complete-functions
function! CompleteMonths(findstart, base)
  if a:findstart
    " Locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " Find months matching with "a:base"
    let res = []
    for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
      if m =~ '^' . a:base
  call add(res, m)
      endif
    endfor
    return res
  endif
endfun
