" strip-trailing-whitespace.vim

" TODO-HIGH: Turn into a single command that takes a range where the default range is %. Make the
" command take additional flag options (like 'c' for confirm)

function! s:Preserve(cmd)
    " Save state
    let l:win_view = winsaveview()
    let l:last_search = getreg('/')
    " Execute the cmd without adding to the changelist or jumplist
    execute 'keepjumps ' . a:cmd
    " Restore state
    call winrestview(l:win_view)
    call setreg('/', l:last_search)
endfunction

function! s:StripTrailingWhitespaceAll()
    call s:Preserve('%s/\s\+$//e')
endfunction

function! s:StripTrailingWhitespaceVisual()
    call s:Preserve("'<,'>s/\s\+$//e")
endfunction

command! StripTrailingWhitespaceAll call s:StripTrailingWhitespaceAll()
command! StripTrailingWhitespaceVisual call s:StripTrailingWhitespaceVisual()
nnoremap gsie :StripTrailingWhitespaceAll<CR>
nnoremap gsae :StripTrailingWhitespaceAll<CR>
xnoremap gs   :<C-u>StripTrailingWhitespaceVisual<CR>
