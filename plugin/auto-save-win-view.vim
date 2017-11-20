" " TODO: Doesn't work when using <C-^> to switch back to a buffer scrolled all the way to the top
" " and the cursor is on the bottom half of the screen
"
" " Temporary fix although :edit commands still don't work :(
" nnoremap <silent> <C-^> :silent buffer #<CR>
"
" " Save current view settings on a per-window, per-buffer basis.
" function! AutoSaveWinView()
"     if !exists("w:SavedBufView")
"         let w:SavedBufView = {}
"     endif
"     let w:SavedBufView[bufnr("%")] = winsaveview()
" endfunction
"
" " Restore current view settings.
" function! AutoRestoreWinView()
"     let buf = bufnr("%")
"     if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
"         let v = winsaveview()
"         let atStartOfFile = v.lnum == 1 && v.col == 0
"         if atStartOfFile && !&diff
"             call winrestview(w:SavedBufView[buf])
"         endif
"         unlet w:SavedBufView[buf]
"     endif
" endfunction
"
"
" " When switching buffers, preserve window view.
" if v:version >= 700
"     autocmd BufLeave * call AutoSaveWinView()
"     autocmd BufEnter * call AutoRestoreWinView()
" endif
