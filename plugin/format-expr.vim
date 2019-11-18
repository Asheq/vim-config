let g:formatexpr_count = 1
func! FormatExpr()
  echo 'formatexpr has been executed ' . g:formatexpr_count . ' times.'
  let g:formatexpr_count = g:formatexpr_count + 1
  return 0
endfunc

