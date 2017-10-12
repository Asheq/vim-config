" vimrc.vim
"
" TODO: Make function names lowercase

function! vimrc#EchoWithColor(msg, highlightGroup, ...)
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction

function! vimrc#GetCacheDir(suffix)
  let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
  call s:EnsureExists(dir)
  return dir
endfunction

function! s:EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

function! vimrc#Preserve(cmd)
    " Save state
    let l:win_view = winsaveview()
    let l:last_search = getreg('/')
    " Execute the cmd without adding to the changelist or jumplist
    execute 'keepjumps ' . a:cmd
    " Restore state
    call winrestview(l:win_view)
    call setreg('/', l:last_search)
endfunction

" Returns current working directory reduced to relative to home directory, ~
function vimrc#getcwd()
    let cwd = fnamemodify(getcwd(), ':~')
    " If cwd is ~, don't include awkward trailing slash
    if (cwd == '~/')
        return '~'
    endif
    return cwd
endfunction

function vimrc#fnamemodify_relative_to_home(fname)
    " File name is unmodified if the file is a descendent of the current working directory (cwd). If
    " the file is not a descendent of the cwd, then and only then is filename reduced to be relative
    " to ~. We can catch such a case by checking if fname has a leading forward slash. (A forward
    " slash has a Unicode code point of 47).
    if (strgetchar(a:fname, 0) == 47)
        return fnamemodify(a:fname, ':~')
    else
        return a:fname
    endif

endfunction

function! vimrc#GetFileHead()
    let head = expand('%:h')

    let head = vimrc#fnamemodify_relative_to_home(head)

    " If file is direct child of the current working directory, it will be represented by a dot. In
    " such a case, let's simply not return anything. Else, let's shorten the path and add a trailing
    " forward slash so it looks nice next to the file tail
    if (head == '.' || head == '')
        return ''
    else
        let head = pathshorten(head)
        if (strgetchar(head, len(head)-1) == 47)
            return head
        else
            return head . '/'
        endif
    endif
endfunction

" vim: fdm=marker
