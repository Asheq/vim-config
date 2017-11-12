function! Define(visual_mode)
  if !exists(':OpenBrowser')
    throw 'Need open-browser plugin to be installed'
  endif

  if !a:visual_mode
    execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . expand("<cword>")
  else
    let temp = @"
    silent normal! gvy
    execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . @"
    let @" = temp
  endif
endfunction
