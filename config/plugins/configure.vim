" vim: fdm=marker

" Other {{{
  let g:javascript_plugin_jsdoc = 1
  let g:vim_json_syntax_conceal = 0
  let g:sneak#streak = 1
  " let g:gtfo#terminals = { 'win' : 'cmd' } " TODO: Figure out how to specify cmd as terminal
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
