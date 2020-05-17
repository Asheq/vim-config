" Configure plugins
" ============================================================================

" vim-auto-save
" ----------------------------------------------------------------------------
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["CursorHold"]

" hexokinase.txt
" ----------------------------------------------------------------------------
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_virtualText = '██'
let g:Hexokinase_ftEnabled = ['css', 'html', 'scss']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

" vCoolor
" ----------------------------------------------------------------------------
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<A-c>'
let g:vcoolor_lowercase = 1

" vim-caser
" ----------------------------------------------------------------------------
let g:caser_no_mappings = 1

" markdown-preview
" ----------------------------------------------------------------------------
let g:mkdp_auto_close = 0

" flagship.txt
" ----------------------------------------------------------------------------
let g:tabinfix = " "
let g:tablabel = "%{vimrc#get_tab_cwd(v:lnum)}"
augroup global_flags
  autocmd!
  autocmd User Flags call Hoist("global", " %{vimrc#get_global_cwd()}")
augroup end

" rainbow
" ----------------------------------------------------------------------------
let g:rainbow_active = 1

" textobj-line.txt
" ----------------------------------------------------------------------------
" NOTE: 'il' and 'al' mappings are taken by Targets plugin.
let g:textobj_line_no_default_key_mappings = 1
xmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
xmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" undotree.txt
" ----------------------------------------------------------------------------
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_HelpLine = 0

" mucomplete.txt
" ----------------------------------------------------------------------------
let g:mucomplete#enable_auto_at_startup = 1
" NOTE Keep the chain short to avoid the flickering that occurs when auto
" switching between completion methods
let g:mucomplete#chains = {'vim': ['path', 'cmd', 'c-n'], 'default': ['path', 'c-n']}

" asterisk.txt
" ----------------------------------------------------------------------------
let g:asterisk#keeppos = 1
