let g:symbols_branch = '⎇ '
let g:symbols_fold = '==='
let g:symbols_filetype = 'λ '
let g:symbols_folder = ''
let g:symbols_window_percentage = ''

let g:symbols_max = 'M'
let g:symbols_scrollbind = 'O'
let g:symbols_wrap = 'W'
let g:symbols_spell = 'S'
let g:symbols_list = 'L'

if vimrc#use_fancy_symbols()
  let g:symbols_branch = ' '
  let g:symbols_fold = ' '
  let g:symbols_filetype = ' '
  let g:symbols_folder = '  '
  let g:symbols_window_percentage = ' '

  " let g:symbols_max = ' '
  " let g:symbols_scrollbind = '痢'
  " let g:symbols_wrap = ' '
  " let g:symbols_spell = '暈'
  " let g:symbols_list = '○'
endif
