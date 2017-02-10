" vim: fdm=marker

" Other {{{
  let g:sneak#streak = 1
  let g:gtfo#terminals = { 'win' : 'cmd.exe /k' }
  let g:wordmotion_mappings = {
    \ 'w' : 'gw',
    \ 'b' : 'gb',
    \ 'e' : 'ge',
    \ 'aw' : 'agw',
    \ 'iw' : 'igw'
    \ }
" }}}

" qf {{{
  let g:qf_statusline = {}
  let g:qf_statusline.before = '%<\ '
  let g:qf_statusline.after = '\ %f%=%l\/%-6L\ \ \ \ \ '
  let g:qf_mapping_ack_style = 1
" }}}

" Mappings within Dirvish {{{
  augroup my_dirvish_events
    autocmd!
    autocmd FileType dirvish nnoremap <buffer> ~ :Dirvish ~<CR>

    " TODO: Fix delay
    autocmd FileType dirvish nnoremap <buffer> \ :Dirvish \<CR>
  augroup END
" }}}

" Denite {{{
  call denite#custom#option('default', 'prompt', 'λ:')
  call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" }}}

" Denite menus {{{
  let s:menus = {}
  let s:menus.user_configuration = {
    \ 'description': 'Edit your user configuration files for various applications'
    \ }
  let s:menus.user_configuration.file_candidates = [
    \ ['.editorconfig', '~/.editorconfig'],
    \ ['.gitconfig', '~/.gitconfig'],
    \ ['.agignore', '~/.agignore'],
    \ ['.vimrc', '~/.vim/vimrc']
    \ ]
  let s:menus.my_commands = {
    \ 'description': 'Vim commands'
    \ }
  let s:menus.my_commands.command_candidates = [
    \ ['Open user configuration menu', 'Denite menu:user_configuration'],
    \ ]
  call denite#custom#var('menu', 'menus', s:menus)
" }}}

" Mappings within Denite {{{
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
