" vim: fdm=marker

" Other {{{
  " TODO: 'a' does not work as alias for angle brankets
  let g:targets_pairs = '()b {}B []r <>a'
  let g:lion_squeeze_spaces = 1
  let g:gtfo#terminals = { 'win' : 'cmd.exe /k' }
  let g:wordmotion_mappings = {
    \ 'w' : 'gw',
    \ 'b' : 'gb',
    \ 'e' : 'ge',
    \ 'aw' : 'agw',
    \ 'iw' : 'igw'
    \ }
" }}}

" Sneak {{{
  let g:sneak#label = 1
  let g:sneak#use_ic_scs = 1
  let g:sneak#label_esc = "\<CR>"
  autocmd ColorScheme * hi Sneak      gui=bold guifg=white guibg=#d96e8a cterm=bold ctermfg=white ctermbg=magenta
  autocmd ColorScheme * hi SneakLabel gui=bold guifg=black guibg=#88da77 cterm=bold ctermfg=black ctermbg=green
" }}}

" qf {{{
  let g:qf_auto_resize = 0
  let g:qf_mapping_ack_style = 1
  let g:qf_statusline = {}
  let g:qf_statusline.after = '\ %f%=%l\ \/\ %-6L\ \ \ \ \ '
  let g:qf_statusline.before = '%<\ '
" }}}

" Dirvish {{{
  augroup my_dirvish_events
    autocmd!
    autocmd FileType dirvish nnoremap <buffer> ~ :Dirvish ~<CR>
    autocmd FileType dirvish nnoremap <nowait> <buffer> \ :Dirvish \<CR>
  augroup END
" }}}

" Denite {{{
  call denite#custom#option('default', 'prompt', 'λ:')
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
