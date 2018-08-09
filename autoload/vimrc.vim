" TODO: Refactor
" TODO: Create gists

" Get cache directories {{{
function! vimrc#get_vim_undo_dir() abort
  let dir = s:expand_and_resolve('~/.vim/cache/vim_undo')
  call s:create(dir)
  return dir
endfunction

function! vimrc#get_vim_swap_dir() abort
  let dir = s:expand_and_resolve('~/.vim/cache/vim_swap')
  call s:create(dir)
  return dir
endfunction

function! vimrc#get_vim_backup_dir() abort
  let dir = s:expand_and_resolve('~/.vim/cache/vim_backup')
  call s:create(dir)
  return dir
endfunction

function! vimrc#get_session_dir() abort
  let dir = s:expand_and_resolve('~/.vim/cache/session')
  call s:create(dir)
  return dir
endfunction

function! s:expand_and_resolve(path) abort
  return resolve(expand(a:path))
endfunction

function! s:create(path) abort
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction
" }}}

" Get buffer display name " {{{
function! vimrc#get_buffer_display_name()
  let full_path = expand('%:p')
  return fnamemodify(full_path, ':.')
endfunction
" }}}

" Restore and make last session " {{{
function! vimrc#restore_last_session() abort
    execute 'silent source ' . vimrc#get_session_dir() . '/last'
    echo 'Last session restored'
endfunction

function! vimrc#make_last_session() abort
  execute ':silent mksession! ' . vimrc#get_session_dir() . '/last'
endfunction
 " }}}

function! vimrc#preserve(cmd) abort " {{{
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')

  execute 'keepjumps ' . a:cmd

  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction " }}}

function! vimrc#smart_win_move_or_create(key) abort " {{{
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction " }}}

function! vimrc#save_buffer() abort " {{{
  if empty(&buftype) && !empty(bufname(''))
    let l:savemarks = {
          \ "'[": getpos("'["),
          \ "']": getpos("']")
          \ }

    silent! update

    for [l:key, l:value] in items(l:savemarks)
      call setpos(l:key, l:value)
    endfor
  endif
endfunction " }}}

function! vimrc#change_directory() abort " {{{
  let choice = confirm("Change directory?", "&global\n&tab\n&local\n&cancel", 1)

  if choice == 4
    return
  endif

  if choice == 1
    let prefix = ''
  elseif choice == 2
    let prefix = 't'
  elseif choice == 3
    let prefix = 'l'
  endif
  execute prefix . 'cd %:h'
endfunction " }}}

function! vimrc#get_visual_selection() " {{{
  let temp = @@
  silent normal! gvy
  let raw_text = @@
  let @@ = temp

  return raw_text
endfunction " }}}

function! vimrc#define(visual_mode) abort " {{{

  if a:visual_mode
    let search_term = vimrc#get_visual_selection()
  else
    let search_term = expand("<cword>")
  endif

  execute 'silent !open dict://' . search_term

  " if !exists(':OpenBrowser')
  "   throw 'Need open-browser plugin to be installed'
  " endif
  " execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . search_term

endfunction " }}}

" File info {{{
if has('multi_byte')
  let s:seperator = '―――――――――――――――――――――――――――――――――――――――――――――'
else
  let s:seperator = '---------------------------------------------'
endif

function! vimrc#print_file_info() abort
  call s:echo_with_color(' Working Directory: ', 'Title')
  call s:echo_with_color(getcwd(), 'Normal', 1)
  call s:echo_with_color(s:seperator, 'Title')
  call s:echo_with_color('              File: ', 'Title')
  call s:echo_with_color(vimrc#get_buffer_display_name(), 'Normal', 1)
  call s:echo_with_color(s:seperator, 'Title')
  call s:echo_with_color('          Filetype: ', 'Title')
  call s:echo_with_color(&filetype, 'Normal', 1)
  call s:echo_with_color('Character Encoding: ', 'Title')
  call s:echo_with_color(&fileencoding, 'Normal', 1)
  call s:echo_with_color('        Git Branch: ', 'Title')
  call s:echo_with_color(fugitive#head(), 'Normal', 1)
  call s:echo_with_color('    Tabs or Spaces: ', 'Title')
  call s:echo_with_color(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
  call s:echo_with_color('          Tab Size: ', 'Title')
  call s:echo_with_color(&tabstop . ' Characters', 'Normal', 1)
  call s:echo_with_color('       End of Line: ', 'Title')
  call s:echo_with_color(&fileformat, 'Normal', 1)
endfunction

function! s:echo_with_color(msg, highlightGroup, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction
" }}}

function! vimrc#create_toggle_map(letter, test, off, on) " {{{
  execute 'nnoremap [o' . a:letter . ' :' . a:on . '<CR>'
  execute 'nnoremap ]o' . a:letter . ' :' . a:off . '<CR>'
  execute 'nnoremap yo' . a:letter . ' :' . '<C-r>=' . a:test . '?"' . a:off . '":"' . a:on . '"<CR><CR>'
endfunction " }}}

function! vimrc#execute_macro_on_visual_range() range abort " {{{
  echo '@'.getcmdline()
  execute ":" . a:firstline . "," . a:lastline . "normal! @" . nr2char(getchar())
endfunction " }}}

function! vimrc#create_alt_maps_for_terminal_and_normal_mode() abort " {{{
  let maps = [{
        \ 'LHS': 'noremap <silent> <A-h>',
        \ 'RHS': ':call vimrc#smart_win_move_or_create("h")<CR>',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <silent> <A-j>',
        \ 'RHS': ':call vimrc#smart_win_move_or_create("j")<CR>',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <silent> <A-k>',
        \ 'RHS': ':call vimrc#smart_win_move_or_create("k")<CR>',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <silent> <A-l>',
        \ 'RHS': ':call vimrc#smart_win_move_or_create("l")<CR>',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'map <silent> <A-q>',
        \ 'RHS': '<Plug>(qf_qf_toggle)',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <A-c>',
        \ 'RHS': '<C-w>c',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <A-x>',
        \ 'RHS': '<C-w>x',
        \ 'terminalInsert': v:false
        \ },  {
        \ 'LHS': 'noremap <A-H>',
        \ 'RHS': '<C-w>H',
        \ 'terminalInsert': v:true
        \ }, {
        \ 'LHS': 'noremap <A-J>',
        \ 'RHS': '<C-w>J',
        \ 'terminalInsert': v:true
        \ }, {
        \ 'LHS': 'noremap <A-K>',
        \ 'RHS': '<C-w>K',
        \ 'terminalInsert': v:true
        \ }, {
        \ 'LHS': 'noremap <A-L>',
        \ 'RHS': '<C-w>L',
        \ 'terminalInsert': v:true
        \ }, {
        \ 'LHS': 'noremap <A-o>',
        \ 'RHS': '<C-w>o',
        \ 'terminalInsert': v:true
        \ }]
  for m in maps
    execute 'n' . m['LHS'] . ' ' . m['RHS']
    execute 't' . m['LHS'] . ' <C-\><C-n>' . m['RHS'] . (m['terminalInsert'] ? 'i' : '')
  endfor
endfunction " }}}

function! vimrc#get_statusline_padding_left() abort " {{{
  if &foldcolumn == 0 || &foldcolumn == 1
    return repeat(' ', &foldcolumn)
  else
    return repeat(' ', &foldcolumn + 1)
  endif
endfunction " }}}

function! s:in_terminal_buffer() abort
  return exists('b:terminal_job_id')
endfunction

function! vimrc#open_dirvish_here() abort " {{{
  if s:in_terminal_buffer()
    silent Dirvish
  else
    Dirvish %:p:h
  endif
endfunction " }}}

function! vimrc#get_maximized_flag(tabnr) abort " {{{
  if !empty(gettabvar(a:tabnr, 'maximizer_sizes'))
    return '[Max]'
  endif

  return ''
endfunction " }}}

function! vimrc#get_global_cwd() " {{{
    return getcwd(-1, -1)
endfunction
" }}}

function! vimrc#get_tab_cwd(tabnr) abort " {{{
    if haslocaldir(-1, a:tabnr)
        return '[' . getcwd(-1, a:tabnr) . ']'
    endif
    return ""
endfunction
" }}}

function! vimrc#get_window_cwd() " {{{
    if haslocaldir(0)
        return '[' . getcwd() . ']'
    endif
    return ""
endfunction
" }}}

" vim: fdm=marker
