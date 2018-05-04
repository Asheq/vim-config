command! FileInfo call s:FileInfo()

if has('multi_byte')
  let s:git_branch = '  '
  let s:working_directory = '  '
  let s:file = '  '
  let s:line_number = ' '
else
  let s:git_branch = ''
  let s:working_directory = ''
  let s:file = ''
  let s:line_number = ''
endif

let s:noscrollbar_track = '-'
let s:noscrollbar_grip = '█'

function! s:FileInfo() abort
  call vimrc#echo_with_color('        Git Branch: ', 'Title')
  call vimrc#echo_with_color(s:git_branch . fugitive#head(), 'Normal', 1)
  call vimrc#echo_with_color(' Working Directory: ', 'Title')
  call vimrc#echo_with_color(s:working_directory . getcwd(), 'Normal', 1)
  call vimrc#echo_with_color('              File: ', 'Title')
  call vimrc#echo_with_color(s:file . bufname('%'), 'Normal', 1)
  call vimrc#echo_with_color('          Filetype: ', 'Title')
  call vimrc#echo_with_color(&filetype, 'Normal', 1)
  call vimrc#echo_with_color('       End of Line: ', 'Title')
  call vimrc#echo_with_color(&fileformat, 'Normal', 1)
  call vimrc#echo_with_color('         Scrollbar: ', 'Title')
  let sb = noscrollbar#statusline(15, s:noscrollbar_track , s:noscrollbar_grip) . s:line_number . line('$')
  call vimrc#echo_with_color(sb, 'Normal', 1)
  call vimrc#echo_with_color('    Tabs or Spaces: ', 'Title')
  call vimrc#echo_with_color(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
  call vimrc#echo_with_color('          Tab Size: ', 'Title')
  call vimrc#echo_with_color(&tabstop, 'Normal', 1)
  call vimrc#echo_with_color('Character Encoding: ', 'Title')
  call vimrc#echo_with_color(&fileencoding, 'Normal', 1)
  call vimrc#echo_with_color('       Scroll Bind: ', 'Title')
  call vimrc#echo_with_color(&scrollbind, 'Normal', 1)
endfunction
