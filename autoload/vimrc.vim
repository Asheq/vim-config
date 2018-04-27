function! vimrc#echo_with_color(msg, highlightGroup, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction

function! vimrc#get_cache_dir(suffix) abort
  let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
  call s:ensure_exists(dir)
  return dir
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

" Collapses home on condition and shortens path
function! vimrc#get_file_head() abort
    let head = expand('%:h')
    if (head == '.' || head == '')
        return ''
    elseif (head == '/')
        return '/'
    else
        return pathshorten(head) . '/'
    endif
endfunction

function! s:ensure_exists(path) abort
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

function! vimrc#autoset_background() abort
  if strftime("%H") < 14
    set background=light
  else
    set background=dark
  endif
endfunction

function! vimrc#WinMove(key) abort
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

" vim: fdm=marker
