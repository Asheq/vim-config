" functions.vim

function! GetCacheDir(suffix)
  let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
  call s:EnsureExists(dir)
  return dir
endfunction

function! EchoWithColor(msg, highlightGroup)
  execute "echohl " . a:highlightGroup
  execute "echo '" . a:msg . "'"
  echohl Normal
endfunction

function! s:EnsureExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), "p")
  endif
endfunction

function! Define(visual_mode)
  if !a:visual_mode
    execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . expand("<cword>")
  else
    let temp = @"
    silent normal! gvy
    execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . @"
    let @" = temp
  endif
endfunction

" vim: fdm=marker
