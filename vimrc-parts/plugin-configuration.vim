" plugin-configuration.vim

" vim-mucomplete
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
let g:mucomplete#enable_auto_at_startup = 1
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set belloff+=ctrlg
" Auto-close preview window that shows details of the given symbol when selecting a completion
autocmd CompleteDone * pclose

" vim-operator-flashy
map y <Plug>(operator-flashy)

" vim-grepper
let g:grepper = {}
let g:grepper.highlight = 1

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
let g:qf_save_win_view = 0
" TODO: vim-qf statusline
let g:qf_statusline = {}
let g:qf_statusline.before = '%<\ '
let g:qf_statusline.after ='\ \ Ξ\ %L\ '
let g:qf_statusline.after.='\ %Y\ '
let g:qf_statusline.after.='%0*'

" vim-dirvish
let g:dirvish_relative_paths = 1

" denite.nvim
try
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
