" functions.vim

function! EchoWithColor(msg, highlightGroup, ...)
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlightGroup
  execute echo_command . " '" . a:msg . "'"
  echohl Normal
endfunction

function! GetCacheDir(suffix)
  let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
  call s:EnsureExists(dir)
  return dir
endfunction

function! s:EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

function! GetTabOrSpaces()
  if &expandtab
    return 'Spaces'
  endif
  return 'Tabs'
endfunction

" vim: fdm=marker
