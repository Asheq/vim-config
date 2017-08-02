" plugin-configuration.vim

" vim-grepper
let g:grep_operator_set_search_register = 1

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

" targets.vim
" The default value of g:targets_pairs is '()b {}B [] <>'
let g:targets_pairs = '()b {}B []r <>a'
" The default value of g:targets_argTrigger is 'a'
let g:targets_argTrigger = ','

" vim-wordmotion
let g:wordmotion_mappings = {
    \ 'w'  : 'gw',
    \ 'b'  : 'gb',
    \ 'e'  : 'ge',
    \ 'aw' : 'agw',
    \ 'iw' : 'igw'
    \ }

" vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" vim-qf
let g:qf_auto_quit = 0
let g:qf_mapping_ack_style = 1
let g:qf_statusline = {}
let g:qf_statusline.after = '\ %f\ %=%5*♡\ %L\ '
let g:qf_statusline.before = '%<\ '

" vim-dirvish
let g:dirvish_relative_paths = 1

" denite.nvim
try
  call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  call denite#custom#map(
      \ 'insert',
      \ '<Tab>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
  call denite#custom#map(
      \ 'insert',
      \ '<S-Tab>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
catch
endtry

" vim: fdm=marker
