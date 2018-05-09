command! FileInfo call s:FileInfo()

if has('multi_byte')
  let s:git_branch = '  '
  let s:working_directory = '  '
  let s:noscrollbar_track = '-'
  let s:noscrollbar_grip = '█'
else
  let s:git_branch = ''
  let s:working_directory = ''
  let s:noscrollbar_track = '-'
  let s:noscrollbar_grip = '#'
endif


function! s:FileInfo() abort
  call s:echo_with_color('        Git Branch: ', 'Title')
  call s:echo_with_color(s:git_branch . fugitive#head(), 'Normal', 1)
  call s:echo_with_color(' Working Directory: ', 'Title')
  call s:echo_with_color(s:working_directory . getcwd(), 'Normal', 1)
  call s:echo_with_color('              File: ', 'Title')
  call s:echo_with_color(bufname('%'), 'Normal', 1)
  call s:echo_with_color('          Filetype: ', 'Title')
  call s:echo_with_color(&filetype, 'Normal', 1)
  call s:echo_with_color('       End of Line: ', 'Title')
  call s:echo_with_color(&fileformat, 'Normal', 1)
  call s:echo_with_color('         Scrollbar: ', 'Title')
  let sb = noscrollbar#statusline(15, s:noscrollbar_track , s:noscrollbar_grip) . ' ' . line('$')
  call s:echo_with_color(sb, 'Normal', 1)
  call s:echo_with_color('    Tabs or Spaces: ', 'Title')
  call s:echo_with_color(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
  call s:echo_with_color('          Tab Size: ', 'Title')
  call s:echo_with_color(&tabstop, 'Normal', 1)
  call s:echo_with_color('Character Encoding: ', 'Title')
  call s:echo_with_color(&fileencoding, 'Normal', 1)
  call s:echo_with_color('       Scroll Bind: ', 'Title')
  call s:echo_with_color(&scrollbind, 'Normal', 1)
endfunction

function! s:echo_with_color(msg, highlightGroup, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction

