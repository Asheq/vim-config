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
  let g:symbols_listchars = 'tab:▷ ,trail:○,extends:◣,precedes:◢,nbsp:◡'
  let g:symbols_showbreak = ' '
else
  let g:symbols_branch = '⎇ '
  let g:symbols_fold = '==='
  let g:symbols_filetype = 'λ '
  let g:symbols_folder = '' " TODO
  let g:symbols_window_percentage = '' " TODO
  let g:symbols_listchars = 'tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let g:symbols_showbreak = '+++'
endif
