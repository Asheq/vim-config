" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map s <Plug>(easymotion-bd-f2)

" color
set background=dark
colorscheme tender
highlight Search guifg=#282828 ctermfg=black guibg=#ffff00 ctermbg=yellow gui=NONE cterm=NONE

" auto-save
let g:auto_save = 1
let g:auto_save_silent = 1

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" vim-dirvish
let g:dirvish_relative_paths = 1

" undotree
let g:undotree_DiffAutoOpen = 0

" vim-lion
let g:lion_squeeze_spaces = 1

" vim-textobj-line
" The 'il' and 'al' text objects are already taken by Targets plugin
let g:textobj_line_no_default_key_mappings = 1
vmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
vmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" vim-qf
let g:qf_auto_quit = 0
let g:qf_mapping_ack_style = 1
let g:qf_save_win_view = 0
let g:qf_statusline = {}
let g:qf_statusline.before = '%#IncSearch#\ '
let g:qf_statusline.after ='\ %0*\ %L\ QuickFix\ Items'

" vim: fdm=marker
