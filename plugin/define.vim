" TODO-HIGH: return if OpenBrowser is not available and setup mappings like OpenBrowser

function! Define(visual_mode)
  if !a:visual_mode
    execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . expand("<cword>")
  else
    let temp = @"
    silent normal! gvy
    execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . @"
    let @" = temp
  endif
endfunction
