command! ChangeDirectory call s:ChangeDirectory()

function! s:ChangeDirectory()
  let choice = confirm("Change directory?", "&Globally\n&Locally\n&Cancel", 1)

  if choice == 3
    return
  endif

  let prefix = ''
  if choice == 2
    let prefix = 'l'
  endif
  execute prefix . 'cd %:h'
  echo ''
  redraw
endfunction
