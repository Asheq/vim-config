function! vimrc#echo_with_color(msg, highlightGroup, ...)
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction

function! vimrc#get_cache_dir(suffix)
  let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
  call s:ensure_exists(dir)
  return dir
endfunction

function! vimrc#preserve(cmd)
    " Save state
    let l:win_view = winsaveview()
    let l:last_search = getreg('/')
    " Execute the cmd without adding to the changelist or jumplist
    execute 'keepjumps ' . a:cmd
    " Restore state
    call winrestview(l:win_view)
    call setreg('/', l:last_search)
endfunction

" Collapses home on condition and shortens path
function! vimrc#get_file_head()
    let head = expand('%:h')
    if (head == '.' || head == '')
        return ''
    elseif (head == '/')
        return '/'
    else
        return pathshorten(head) . '/'
    endif
endfunction

function! s:ensure_exists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

function! vimrc#autoset_background()
  if strftime("%H") < 14
    set background=light
  else
    set background=dark
  endif
endfunction

" vim: fdm=marker
