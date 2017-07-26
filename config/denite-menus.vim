" denite-menus.vim

let s:menus = {}

let s:menus.User_Configuration = {
    \ 'description': 'Edit your user configuration files in home directory'
    \ }
let s:menus.User_Configuration.file_candidates = [
    \ ['.editorconfig', '~/.editorconfig'],
    \ ['.gitconfig', '~/.gitconfig'],
    \ ['.agignore', '~/.agignore'],
    \ ['.vimrc', '~/.vim/vimrc'],
    \ ['.minttyrc', '~/.minttyrc'],
    \ ['.bashrc', '~/.bashrc']
    \ ]

let s:menus.My_Commands = {
    \ 'description': 'Vim commands'
    \ }
let s:menus.My_Commands.command_candidates = [
    \ ['User Configuration Files', 'Denite menu:User_Configuration'],
    \ ]
try
  call denite#custom#var('menu', 'menus', s:menus)
catch
endtry

" vim: fdm=marker
