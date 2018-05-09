function! vimrc#echo_with_color(msg, highlightGroup, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction

function! vimrc#get_undo_dir() abort
  let dir = s:expand_and_resolve('~/.vim_cache_dir/undo')
  call s:ensure_exists(dir)
  return dir
endfunction

function! vimrc#get_swap_dir() abort
  let dir = s:expand_and_resolve('~/.vim_cache_dir/swap')
  call s:ensure_exists(dir)
  return dir
endfunction

function! vimrc#get_session_dir() abort
  let dir = s:expand_and_resolve('~/.vim_cache_dir/session')
  call s:ensure_exists(dir)
  return dir
endfunction

function! s:expand_and_resolve(path) abort
  return resolve(expand(a:path))
endfunction

function! s:ensure_exists(path) abort
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

function! vimrc#restore_last_session() abort
  let choice = confirm("Restore last session?", "&Yes\n&No", 1)
  if choice == 1
    execute 'silent source ' . vimrc#get_session_dir() . '/last'
  endif
endfunction

function! vimrc#make_last_session() abort
  execute ':silent mksession! ' . vimrc#get_session_dir() . '/last'
endfunction

function! vimrc#preserve(cmd) abort
  " Save state
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')
  " Execute the cmd without adding to the changelist or jumplist
  execute 'keepjumps ' . a:cmd
  " Restore state
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction

function! vimrc#win_move(key) abort
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
endfunction

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

" vim: fdm=marker
