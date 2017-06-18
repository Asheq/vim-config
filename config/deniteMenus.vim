" vim: fdm=marker

let s:menus = {}

let s:menus.User_Configuration = {
    \ 'description': 'Edit your user configuration files for various applications'
    \ }
let s:menus.User_Configuration.file_candidates = [
    \ ['.editorconfig', '~/.editorconfig'],
    \ ['.gitconfig', '~/.gitconfig'],
    \ ['.agignore', '~/.agignore'],
    \ ['.vimrc', '~/.vim/vimrc']
    \ ]

let s:menus.My_Commands = {
    \ 'description': 'Vim commands'
    \ }
let s:menus.My_Commands.command_candidates = [
    \ ['Open user configuration menu', 'Denite menu:User_Configuration'],
    \ ]
try
  call denite#custom#var('menu', 'menus', s:menus)
catch
endtry
