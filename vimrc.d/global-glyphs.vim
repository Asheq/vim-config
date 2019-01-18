" Set glyphs to be used globally
" TODO-NOW: Move to autoload/vimrc?

let g:symbols = {}
let g:symbols.max = 'M'
let g:symbols.scrollbind = 'B'
let g:symbols.wrap = 'W'
let g:symbols.spell = 'S'
let g:symbols.list = 'L'

if vimrc#use_fancy_symbols()
  let g:symbols.branch = ' '
  let g:symbols.fold = ' '
  let g:symbols.filetype = ' '
  let g:symbols.directory = ' '
  let g:symbols.window_percentage = ' '
  let g:symbols.listchars = 'tab:▷ ,trail:○,extends:◣,precedes:◢,nbsp:◡'
  let g:symbols.showbreak = ' '
else
  let g:symbols.branch = 'β'
  let g:symbols.fold = '==='
  let g:symbols.filetype = 'Φ'
  let g:symbols.directory = 'Δ'
  let g:symbols.window_percentage = ''
  let g:symbols.listchars = 'tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  let g:symbols.showbreak = '+++'
endif
