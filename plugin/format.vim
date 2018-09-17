" TODO: Release on github as 'super simple formatter'
command! -complete=filetype -nargs=? -range=% Format let winview=winsaveview()|<line1>,<line2>call s:Format(<f-args>)|call winrestview(winview)
function! s:Format(...) range abort
  if exists('a:1')
    let l:filetype = a:1
  else
    let l:filetype = &filetype
    if l:filetype == ''
      echon 'Cannot format. &filetype is empty'
      return
    endif
  endif
  if !has_key(g:formatters, l:filetype)
    echon 'Cannot format. Cannot find entry in g:formatters for filetype: ' . l:filetype
    return
  endif
  let l:formatter = g:formatters[l:filetype]
  cd %:p:h
  let cmd = [
        \ '!',
        \ l:formatter,
        \ ]
  execute a:firstline . ',' . a:lastline . join(cmd)
  cd -
endfunction
