command! FileInfo call s:FileInfo()

function! s:FileInfo() abort
  call vimrc#echo_with_color('        Git Branch: ', 'Title')
  call vimrc#echo_with_color(fugitive#head(), 'Normal', 1)
  call vimrc#echo_with_color(' Working Directory: ', 'Title')
  call vimrc#echo_with_color(getcwd(), 'Normal', 1)
  call vimrc#echo_with_color('              File: ', 'Title')
  call vimrc#echo_with_color(bufname('%'), 'Normal', 1)
  call vimrc#echo_with_color('Character Encoding: ', 'Title')
  call vimrc#echo_with_color(&fenc, 'Normal', 1)
  call vimrc#echo_with_color('       End of Line: ', 'Title')
  call vimrc#echo_with_color(&ff, 'Normal', 1)
  call vimrc#echo_with_color('    Tabs or Spaces: ', 'Title')
  call vimrc#echo_with_color(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
  call vimrc#echo_with_color('          Tab Size: ', 'Title')
  call vimrc#echo_with_color(&tabstop, 'Normal', 1)
  call vimrc#echo_with_color('          Filetype: ', 'Title')
  call vimrc#echo_with_color(&filetype, 'Normal', 1)

  let noscrollbar_track = '-'
  let noscrollbar_grip = '█'

  call vimrc#echo_with_color('         Scrollbar: ', 'Title')
  let sb = noscrollbar#statusline(15, noscrollbar_track , noscrollbar_grip) . ' ' . line('$')
  call vimrc#echo_with_color(sb, 'Normal', 1)
  call vimrc#echo_with_color('       Scroll Bind: ', 'Title')
  call vimrc#echo_with_color(&scrollbind, 'Normal', 1)
endfunction
