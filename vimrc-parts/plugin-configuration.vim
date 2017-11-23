" fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" vim-dirvish
let g:dirvish_relative_paths = 1

" vim-operator-flashy
map y <Plug>(operator-flashy)

" undotree
let g:undotree_DiffAutoOpen = 0

" vim-lion
let g:lion_squeeze_spaces = 1

" vim-grepper
let g:grepper = {}
let g:grepper.highlight = 1

" vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" targets.vim
" The default value of g:targets_pairs is '()b {}B [] <>'
let g:targets_pairs = '()b {}B []r <>a'
" The default value of g:targets_argTrigger is 'a'
let g:targets_argTrigger = ','

" vim-textobj-line
" The 'il' and 'al' text objects are already taken by Targets plugin
let g:textobj_line_no_default_key_mappings = 1
vmap aj <Plug>(textobj-line-a)
omap aj <Plug>(textobj-line-a)
vmap ij <Plug>(textobj-line-i)
omap ij <Plug>(textobj-line-i)

" vim-wordmotion
" TODO: Figure out if I want to use gw for native formatting and gq for external formatting
let g:wordmotion_mappings = {
    \ 'w'  : 'gw',
    \ 'b'  : 'gb',
    \ 'e'  : 'ge',
    \ 'aw' : 'agw',
    \ 'iw' : 'igw'
    \ }

" vim-qf
let g:qf_auto_quit = 0
let g:qf_mapping_ack_style = 1
let g:qf_save_win_view = 0
" TODO: vim-qf statusline
let g:qf_statusline = {}
let g:qf_statusline.before = '%<\ '
let g:qf_statusline.after ='\ \ Ξ\ %L\ '
let g:qf_statusline.after.='\ %Y\ '
let g:qf_statusline.after.='%0*'

" vim: fdm=marker
