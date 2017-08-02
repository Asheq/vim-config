" functions.vim

function! EchoWithColor(msg, highlightGroup)
  execute "echohl " . a:highlightGroup
  execute "echo '" . a:msg . "'"
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

" vim: fdm=marker
