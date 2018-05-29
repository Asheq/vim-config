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

" Restore and make last session " {{{
function! vimrc#restore_last_session() abort
  let choice = confirm("Restore last session?", "&Yes\n&No", 1)
  if choice == 1
    execute 'silent source ' . vimrc#get_session_dir() . '/last'
  endif
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

function! vimrc#win_move(key) abort " {{{
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
  let choice = confirm("Change directory?", "&Globally\n&Locally\n&Cancel", 1)

  if choice == 3
    return
  endif

  let prefix = ''
  if choice == 2
    let prefix = 'l'
  endif
  execute prefix . 'cd %:h'
  echo ''
  redraw
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

function! vimrc#file_info() abort
  call s:echo_with_color('        Git Branch: ', 'Title')
  call s:echo_with_color(fugitive#head(), 'Normal', 1)
  call s:echo_with_color(' Working Directory: ', 'Title')
  call s:echo_with_color(getcwd(), 'Normal', 1)
  call s:echo_with_color('              File: ', 'Title')
  call s:echo_with_color(bufname('%'), 'Normal', 1)
  call s:echo_with_color('          Filetype: ', 'Title')
  call s:echo_with_color(&filetype, 'Normal', 1)
  call s:echo_with_color('              Line: ', 'Title')
  call s:echo_with_color(line('.') . ' of ' . line('$'), 'Normal', 1)

  call s:echo_with_color(s:seperator, 'Title')

  call s:echo_with_color('    Tabs or Spaces: ', 'Title')
  call s:echo_with_color(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
  call s:echo_with_color('          Tab Size: ', 'Title')
  call s:echo_with_color(&tabstop . ' Spaces', 'Normal', 1)

  call s:echo_with_color(s:seperator, 'Title')

  call s:echo_with_color('       End of Line: ', 'Title')
  call s:echo_with_color(&fileformat, 'Normal', 1)
  call s:echo_with_color('Character Encoding: ', 'Title')
  call s:echo_with_color(&fileencoding, 'Normal', 1)

  call s:echo_with_color(s:seperator, 'Title')

  call s:echo_with_color('       Scroll Bind: ', 'Title')
  call s:echo_with_color(&scrollbind, 'Normal', 1)
  call s:echo_with_color('              Zoom: ', 'Title')
  call s:echo_with_color(exists('t:zoomwintab') ? 1 : 0, 'Normal', 1)
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
" vim: fdm=marker
