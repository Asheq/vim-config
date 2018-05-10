" TODO: Add comments

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" undotree
let g:undotree_DiffAutoOpen = 0

" vim-lion
let g:lion_squeeze_spaces = 1

" vim-textobj-line
" NOTE: 'il' and 'al' text objects are already taken by Targets plugin
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

" mucomplete
let g:mucomplete#always_use_completeopt = 1 " Have 'completeopt' affect manual completion

" colorscheme
colorscheme PaperColor

" zoomwintab
let g:zoomwintab_hidetabbar = 0
let g:zoomwintab_remap = 0

" vim: fdm=marker
