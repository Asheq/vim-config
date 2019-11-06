function! StripTrailingWhitespace()
  " Only reformat on explicit gq command
  if mode() != 'n'
    " Fall back to Vim's internal reformatting
    return 1
  endif
  let lines = getline(v:lnum, v:lnum + v:count - 1)
  call map(lines, {key, val -> substitute(val, '\s\+$', '', 'g')})
  call setline('.', lines)

  " Do not run internal formatter!
  return 0
endfunc
