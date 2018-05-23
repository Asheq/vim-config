" ranger
let g:ranger_map_keys = 0

" undotree
let g:undotree_DiffAutoOpen = 0

" vim-lion
let g:lion_squeeze_spaces = 1

" mucomplete
let g:mucomplete#always_use_completeopt = 1

" fieldtrip
let g:fieldtrip_start_map = '<C-s>'

" vim-textobj-line
" NOTE: 'il' and 'al' mappings are taken by Targets plugin.
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
let g:qf_statusline.before = '%#IncSearch#\ %L\ Results\ %0*'
let g:qf_statusline.after =''

" colorscheme
colorscheme PaperColor

" vim: fdm=marker
