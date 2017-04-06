" vim: fdm=marker

" Indent-Guides {{{
  let g:indent_guides_enable_on_vim_startup = 0
" }}}

" Undotree {{{
  let g:undotree_DiffAutoOpen = 0
" }}}

" Lion {{{
  let g:lion_squeeze_spaces = 1
" }}}

" GTFO {{{
  if g:asheq#settings.use_cmd
    let g:gtfo#terminals = { 'win' : 'cmd.exe /k' }
  endif
" }}}

" Textobj-line {{{
  " Note that 'il' and 'al' text objects are taken by Targets plugin
  " so I am replacing them with 'ij' and 'aj'
  let g:textobj_line_no_default_key_mappings = 1
  vmap aj <Plug>(textobj-line-a)
  omap aj <Plug>(textobj-line-a)
  vmap ij <Plug>(textobj-line-i)
  omap ij <Plug>(textobj-line-i)
" }}}

" Targets {{{
  " Default: let g:targets_pairs = '()b {}B [] <>'
  let g:targets_pairs = '()b {}B []r <>a'
  " Default: let g:targets_argTrigger = 'a'
  let g:targets_argTrigger = ','
" }}}

" Wordmotion {{{
  let g:wordmotion_mappings = {
    \ 'w'  : 'gw',
    \ 'b'  : 'gb',
    \ 'e'  : 'ge',
    \ 'aw' : 'agw',
    \ 'iw' : 'igw'
    \ }
" }}}

" Sneak {{{
  autocmd ColorScheme * hi Sneak      gui=bold guifg=white guibg=#d96e8a cterm=bold ctermfg=white ctermbg=magenta
  autocmd ColorScheme * hi SneakLabel gui=bold guifg=black guibg=#88da77 cterm=bold ctermfg=black ctermbg=green
  let g:sneak#label = 1
  let g:sneak#label_esc = "\<CR>"
  let g:sneak#use_ic_scs = 1
" }}}

" qf {{{
  let g:qf_auto_quit = 0
  let g:qf_auto_resize = 0
  let g:qf_mapping_ack_style = 1
  let g:qf_statusline = {}
  let g:qf_statusline.after = '\ %f%=%l\ \/\ %-6L\ \ \ \ \ '
  let g:qf_statusline.before = '%<\ '
" }}}

" Dirvish {{{
  let g:dirvish_relative_paths = 1
  augroup my_dirvish_events
    autocmd!
    autocmd FileType dirvish nnoremap <silent> <buffer> ~ :Dirvish ~<CR>
    autocmd FileType dirvish nnoremap <silent> <nowait> <buffer> \ :Dirvish \<CR>
  augroup END
" }}}

" Denite {{{
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
" }}}
