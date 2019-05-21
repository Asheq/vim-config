" TODO-WAIT: Move to autoload/vimrc?

let g:glyphs = {}
let g:glyphs.max = 'M'
let g:glyphs.scrollbind = 'B'
let g:glyphs.wrap = 'W'
let g:glyphs.spell = 'S'
let g:glyphs.list = 'L'
let g:glyphs.showbreak = '  '
let g:glyphs.listchars = 'tab:▷ ,trail:○,extends:◣,precedes:◢,nbsp:◡'

if vimrc#use_fancy_glyphs()
  let g:glyphs.branch = ' '
  let g:glyphs.directory = '📂'
  let g:glyphs.file = '📄'
  let g:glyphs.fold = '🙈'
else
  let g:glyphs.branch = 'β'
  let g:glyphs.directory = 'Δ'
  let g:glyphs.file = 'Φ'
  let g:glyphs.fold = '==='
endif
