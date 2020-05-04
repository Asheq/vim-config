augroup make_session
  autocmd!
  autocmd VimLeave * call s:make_last_session()
augroup end

function! s:make_last_session() abort
  execute ':silent mksession! ' . s:get_session_dir() . '/last'
endfunction

function! s:restore_last_session() abort
  execute 'source ' . s:get_session_dir() . '/last'
endfunction

function! s:get_session_dir() abort
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

command! -nargs=0 RestoreLastSession call s:restore_last_session()
