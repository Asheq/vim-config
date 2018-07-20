augroup smart_cursorline
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
augroup end

augroup set_stdin_buftype
  autocmd!
  autocmd StdinReadPost * set buftype=nofile
augroup end

augroup make_session
  autocmd!
  autocmd VimLeave * call vimrc#make_last_session()
augroup end

function! s:save_buffer() abort
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

augroup save_buffer
  autocmd!
  autocmd InsertLeave,TextChanged * nested call s:save_buffer()
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup end

if has('nvim')
  augroup terminal_mods
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup end
endif
