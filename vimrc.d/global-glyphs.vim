" TODO-WAIT: Move to autoload/vimrc?
" TODO-WAIT: Do not use double-width glyphs

let g:glyphs = {}
let g:glyphs.max = 'M'
let g:glyphs.scrollbind = 'B'
let g:glyphs.wrap = 'W'
let g:glyphs.spell = 'S'
let g:glyphs.list = 'L'
let g:glyphs.showbreak = '  '

if vimrc#use_fancy_glyphs()
  let g:glyphs.branch = ' '
  let g:glyphs.fold = ' '
  let g:glyphs.filetype = ' '
  let g:glyphs.directory = ' '
  let g:glyphs.window_percentage = ' '
  let g:glyphs.listchars = 'tab:▷ ,trail:○,extends:◣,precedes:◢,nbsp:◡'
  " let g:glyphs.showbreak = ' '
else
  let g:glyphs.branch = 'β'
  let g:glyphs.fold = '==='
  let g:glyphs.filetype = 'Φ'
  let g:glyphs.directory = 'Δ'
  let g:glyphs.window_percentage = ''
  let g:glyphs.listchars = 'tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
  " let g:glyphs.showbreak = '+++'
endif
