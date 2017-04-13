" vim: fdm=marker

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
try
  call denite#custom#var('menu', 'menus', s:menus)
catch
endtry
