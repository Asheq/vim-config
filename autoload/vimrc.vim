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

" Collapses home
function vimrc#getcwd()
    let cwd = fnamemodify(getcwd(), ':~')
    if (cwd == '~/')
        return '~'
    endif
    return cwd
endfunction

" Collapses home on condition
function vimrc#bufname(type)
    return s:fnamemodify_collapse_home_on_condition(bufname(a:type))
endfunction

" Collapses home on condition and shortens path
function! vimrc#get_file_head()
    let head = expand('%:h')
    if (head == '.' || head == '')
        return ''
    else
        let head = pathshorten(s:fnamemodify_collapse_home_on_condition(head))
        if (strgetchar(head, len(head)-1) == 47)
            return head
        else
            return head . '/'
        endif
    endif
endfunction

function s:fnamemodify_collapse_home_on_condition(fname)
    if (strgetchar(a:fname, 0) == 47)
        return fnamemodify(a:fname, ':~')
    else
        return a:fname
    endif
endfunction

function! s:ensure_exists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction


" vim: fdm=marker
