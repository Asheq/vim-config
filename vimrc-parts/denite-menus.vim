" denite-menus.vim

let s:menus = {}

let s:menus.edit_user_config = {'description': "Edit configuration files in user's home directory"}
let s:menus.edit_user_config.file_candidates = [
      \ ['.editorconfig', '~/.editorconfig'],
      \ ['.gitconfig', '~/.gitconfig'],
      \ ['.agignore', '~/.agignore'],
      \ ['.vimrc', '~/.vim/vimrc'],
      \ ['.minttyrc', '~/.minttyrc'],
      \ ['.bashrc', '~/.bashrc']
    \ ]

let s:menus.tern_commands = {'description': 'Tern Commands'}
let s:menus.tern_commands.command_candidates = [
      \ ['       TernDoc: Look up Documentation', 'TernDoc'],
      \ [' TernDocBrowse: Browse the Documentation', 'TernDocBrowse'],
      \ ['      TernType: Perform a type look up', 'TernType'],
      \ ['       TernDef: Look up definition', 'TernDef'],
      \ ['TernDefPreview: Look up definition in preview', 'TernDefPreview'],
      \ ['  TernDefSplit: Look up definition in new split', 'TernDefSplit'],
      \ ['    TernDefTab: Look up definition in new tab', 'TernDefTab'],
      \ ['      TernRefs: Look up references', 'TernRefs'],
      \ ['    TernRename: Rename identifier', 'TernRename']
      \ ]

let s:menus.all_menus = {'description': 'All Menus'}
let s:menus.all_menus.command_candidates = [
      \ ['Edit User Configuration', 'Denite menu:edit_user_config'],
      \ ['Tern Commands', 'Denite menu:tern_commands'],
      \ ]

try
  call denite#custom#var('menu', 'menus', s:menus)
catch
endtry

" vim: fdm=marker
