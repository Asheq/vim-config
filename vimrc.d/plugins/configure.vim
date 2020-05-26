" textobj-line.txt
" ----------------------------------------------------------------------------
" NOTE: 'il' and 'al' mappings are taken by Targets plugin.
let g:textobj_line_no_default_key_mappings = 1
xmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
xmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" vim-auto-save
" ----------------------------------------------------------------------------
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["CursorHold"]

" hexokinase.txt
" ----------------------------------------------------------------------------
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_ftEnabled = ['css', 'html', 'scss']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

" vCoolor
" ----------------------------------------------------------------------------
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<A-c>'

" vim-caser
" ----------------------------------------------------------------------------
let g:caser_no_mappings = 1

" markdown-preview
" ----------------------------------------------------------------------------
let g:mkdp_auto_close = 0

" rainbow
" ----------------------------------------------------------------------------
let g:rainbow_active = 1

" asterisk.txt
" ----------------------------------------------------------------------------
let g:asterisk#keeppos = 1
