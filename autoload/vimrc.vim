" TODO: Create gists.
" TODO: aborts?

" Get session directory {{{
function! vimrc#get_session_dir() abort
  let dir = s:expand_and_resolve_path('~/.vim/cache/session')
  call s:create_dir(dir)
  return dir
endfunction

function! s:expand_and_resolve_path(path) abort
  return resolve(expand(a:path))
endfunction

function! s:create_dir(path) abort
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction
" }}}

" Restore and make last session {{{
function! vimrc#restore_last_session() abort
  execute 'silent source ' . vimrc#get_session_dir() . '/last'
  echo 'Last session restored'
endfunction

function! vimrc#make_last_session() abort
  execute ':silent mksession! ' . vimrc#get_session_dir() . '/last'
endfunction
" }}}

" Smart window move {{{
function! vimrc#smart_window_move(key) abort
  let curwin = winnr()
  execute 'wincmd ' . a:key
  if (curwin == winnr())
    if (a:key == 'j' || a:key == 'k')
      wincmd s
    else
      wincmd v
    endif
    exec 'wincmd ' . a:key
  endif
endfunction
" }}}

" Save buffer {{{
function! vimrc#save_buffer() abort
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
endfunction
" }}}

" Get visual selection raw text {{{
function! vimrc#get_visual_selection_raw_text()
  let temp = @@
  silent normal! gvy
  let raw_text = @@
  let @@ = temp
  return raw_text
endfunction
" }}}

" Define {{{
function! vimrc#define_mac_dict(search_term) abort
  execute 'silent !open dict://' . a:search_term
endfunction

function! vimrc#define_merriam_webster_web(search_term) abort
  if !exists(':OpenBrowser')
    throw 'Need open-browser plugin to be installed'
  endif
  execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . search_term
endfunction
" }}}

" Echo with color {{{
function! s:echo_with_color(msg, highlightGroup, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction
" }}}

" Create toggle map {{{
function! vimrc#create_toggle_map(letter, test, off, on)
  execute 'nnoremap [o' . a:letter . ' :' . a:on . '<CR>'
  execute 'nnoremap ]o' . a:letter . ' :' . a:off . '<CR>'
  execute 'nnoremap yo' . a:letter . ' :' . '<C-r>=' . a:test . '?"' . a:off . '":"' . a:on . '"<CR><CR>'
endfunction
" }}}

" Execute macro on visual range {{{
function! vimrc#execute_macro_on_visual_range() range abort
  echo '@'.getcmdline()
  execute ":" . a:firstline . "," . a:lastline . "normal! @" . nr2char(getchar())
endfunction
" }}}

" Open dirvish here {{{
function! vimrc#open_dirvish_here() abort
  if s:in_terminal_buffer()
    silent Dirvish
  else
    Dirvish %:p:h
  endif
endfunction

function! s:in_terminal_buffer() abort
  return exists('b:terminal_job_id')
endfunction
" }}}

" Get statusline padding left {{{
function! vimrc#get_statusline_padding_left() abort
  if &foldcolumn == 0 || &foldcolumn == 1
    return repeat(' ', &foldcolumn)
  else
    return repeat(' ', &foldcolumn + 1)
  endif
endfunction
" }}}

" Get listed or loaded buffers {{{
function! vimrc#get_listed_or_loaded_buffers()
  return filter(getbufinfo(), 'v:val.listed || v:val.loaded')
endfunction
" }}}

" Relative to home " {{{
function! s:relative_to_home(cwd)
  let cwd = fnamemodify(a:cwd, ':~')
  if cwd == '~/'
    let cwd = '~'
  endif
  return cwd
endfunction
" }}}

" Get cwd {{{
function! vimrc#get_global_cwd()
  let global_cwd = getcwd(-1, -1)
  return s:relative_to_home(global_cwd)
endfunction

function! vimrc#get_tab_cwd(tabnr) abort
  if haslocaldir(-1, a:tabnr)
    let tab_cwd = getcwd(-1, a:tabnr)
    return s:relative_to_home(tab_cwd)
  endif
  return ''
endfunction

function! vimrc#get_window_cwd()
  if haslocaldir(0)
    let window_cwd = getcwd()
    return s:relative_to_home(window_cwd)
  endif
  return ''
endfunction
" }}}

function! vimrc#use_fancy_symbols() " {{{
  return exists('$USE_FANCY_SYMBOLS')
endfunction
" }}}

" Symbol definitions {{{
if vimrc#use_fancy_symbols()
  let s:branch_symbol = ' '
  let s:max_symbol = ' '
  let s:fold_symbol = ' '
  let s:folder_symbol = '  '
else
  let s:branch_symbol = '⎇ '
  let s:max_symbol = 'Z'
  let s:fold_symbol = '==='
  let s:folder_symbol = ''
endif
" }}}

" Get fold text {{{
function! vimrc#get_fold_text()
  let nl = v:foldend - v:foldstart + 1
  let line = getline(v:foldstart)
  let indent_level = indent(v:foldstart)
  let sub = substitute(line, '^[ \t]*', '', 'g')
  let indent = repeat(' ',indent_level)
  return indent . sub . ' ' . s:fold_symbol . ' ' . nl . ' Lines'
endfunction
" }}}

" Get git branch flag {{{
function! vimrc#get_git_branch_flag()
  let head = FugitiveHead()
  if head != ''
      return '[' . s:branch_symbol . head . ']'
  endif
  return ''
endfunction
" }}}

" Get maximixed flag {{{
function! vimrc#get_maximized_flag(tabnr) abort
  if !empty(gettabvar(a:tabnr, 'maximizer_sizes'))
    return '[' . s:max_symbol . ']'
  endif
  return ''
endfunction
" }}}

" Get cwd flags {{{
function! vimrc#format_cwd_as_flag(cwd)
  if a:cwd != ''
    return '[' . s:folder_symbol . a:cwd . ']'
  endif
  return ''
endfunction

function! vimrc#get_global_cwd_flag()
  return vimrc#format_cwd_as_flag(vimrc#get_global_cwd())
endfunction

function! vimrc#get_tab_cwd_flag(tabnr) abort
  return vimrc#format_cwd_as_flag(pathshorten(vimrc#get_tab_cwd(a:tabnr)))
endfunction

function! vimrc#get_window_cwd_flag()
  return vimrc#format_cwd_as_flag(pathshorten(vimrc#get_window_cwd()))
endfunction
" }}}

" Get buffer display name " {{{
function! vimrc#get_buffer_head_display_name()
  " % = Current file name, as opened
  " ~ = If file is below $HOME, display file name relative to ~ (otherwise leave unmodified)
  " . = If file is below cwd, display file name relative to cwd (otherwise leave unmodified)
  " h = Display file name with last component and separators removed
  let head = expand('%:~:.:h')
  if head == '.' || head == ''
    let head = ''
  elseif head == '/'
    let head = '/'
  else
    let head = head . '/'
  endif
  return head
endfunction
" }}}

" File info {{{
function! vimrc#print_file_info() abort
  call s:echo_with_color(' Working Directory: ', 'Title')
  call s:echo_with_color(s:relative_to_home(getcwd()), 'Normal', 1)
  call s:echo_with_color("\n", 'Title')
  call s:echo_with_color('              File: ', 'Title')
  call s:echo_with_color(vimrc#get_buffer_head_display_name() . expand('%:t'), 'Normal', 1)
  call s:echo_with_color('        Git Branch: ', 'Title')
  call s:echo_with_color(FugitiveHead(), 'Normal', 1)
  call s:echo_with_color("\n", 'Title')
  call s:echo_with_color('          Filetype: ', 'Title')
  call s:echo_with_color(&filetype, 'Normal', 1)
  call s:echo_with_color('Character Encoding: ', 'Title')
  call s:echo_with_color(&fileencoding, 'Normal', 1)
  call s:echo_with_color('    Tabs or Spaces: ', 'Title')
  call s:echo_with_color(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
  call s:echo_with_color('          Tab Size: ', 'Title')
  call s:echo_with_color(&tabstop . ' Characters', 'Normal', 1)
  call s:echo_with_color('       End of Line: ', 'Title')
  call s:echo_with_color(&fileformat, 'Normal', 1)
endfunction
" }}}

function! vimrc#get_tab_name(tabnr) " {{{
  let tab_name = gettabvar(a:tabnr, 'name')
  if tab_name != ''
    return tab_name
  else
    return a:tabnr
  endif
endfunction
" }}}

" Create alt maps for terminal and normal mode {{{
function! vimrc#create_alt_maps_for_terminal_and_normal_mode() abort
  let maps = [{
        \ 'LHS': 'noremap <silent> <A-h>',
        \ 'RHS': ':call vimrc#smart_window_move("h")<CR>',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <silent> <A-j>',
        \ 'RHS': ':call vimrc#smart_window_move("j")<CR>',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <silent> <A-k>',
        \ 'RHS': ':call vimrc#smart_window_move("k")<CR>',
        \ 'terminalInsert': v:false
        \ }, {
        \ 'LHS': 'noremap <silent> <A-l>',
        \ 'RHS': ':call vimrc#smart_window_move("l")<CR>',
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
endfunction
" }}}
" vim: fdm=marker
