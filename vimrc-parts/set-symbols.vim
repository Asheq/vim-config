" TODO-NOW: Rename. Having 'symbols' first sounds off.
let g:symbols_max = 'M'
let g:symbols_scrollbind = 'B'
let g:symbols_wrap = 'W'
let g:symbols_spell = 'S'
let g:symbols_list = 'L'

if vimrc#use_fancy_symbols()
  let g:symbols_branch = ' '
  let g:symbols_fold = ' '
  let g:symbols_filetype = ' '
  let g:symbols_directory = ' '
  let g:symbols_window_percentage = ' '
  let g:symbols_listchars = 'tab:▷ ,trail:○,extends:◣,precedes:◢,nbsp:◡'
  let g:symbols_showbreak = ' '
else
  let g:symbols_branch = 'β '
  let g:symbols_fold = '==='
  let g:symbols_filetype = 'Φ'
  let g:symbols_directory = 'Δ'
  let g:symbols_window_percentage = ''
  let g:symbols_listchars = 'tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let g:symbols_showbreak = '+++'
endif
