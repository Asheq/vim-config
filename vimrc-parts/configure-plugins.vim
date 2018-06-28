" dirvish
let g:dirvish_relative_paths = 1

" sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" undotree
let g:undotree_DiffAutoOpen = 0

" vim-lion
let g:lion_squeeze_spaces = 1

" mucomplete
let g:mucomplete#always_use_completeopt = 1
let g:mucomplete#no_popup_mappings = 1
imap <c-y> <plug>(MUcompletePopupAccept)
imap <cr> <plug>(MUcompleteCR)

" fieldtrip
let g:fieldtrip_start_map = '<C-s>'

" vim-textobj-line
" NOTE: 'il' and 'al' mappings are taken by Targets plugin.
let g:textobj_line_no_default_key_mappings = 1
xmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
xmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" vim-qf
let g:qf_auto_quit = 0
let g:qf_mapping_ack_style = 1
let g:qf_save_win_view = 0
let g:qf_statusline = {}
let g:qf_statusline.before = '\ \ %L\ '
let g:qf_statusline.after = ''

" colorscheme
colorscheme tender

" vim: fdm=marker
