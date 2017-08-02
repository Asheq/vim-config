" source-vimscript.vim

xnoremap <silent> <Plug>SourceVimscript     :<C-U>call <SID>go(visualmode())<CR>
nnoremap <silent> <Plug>SourceVimscript     :<C-U>set opfunc=<SID>go<CR>g@
nnoremap <silent> <Plug>SourceVimscriptLine :<C-U>set opfunc=<SID>go<Bar>exe 'norm! 'v:count1.'g@_'<CR>

if !hasmapto('<Plug>SourceVimscript') || maparg('gs', 'n') ==# ''
    xmap gs  <Plug>SourceVimscript
    nmap gs  <Plug>SourceVimscript
    nmap gss <Plug>SourceVimscriptLine
endif

function! s:go(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v' || a:type ==# 'V'
        normal! gvy
    elseif a:type ==# 'char'
        normal! `[v`]y
    elseif a:type ==# 'line'
        normal! `[V`]y
    else
        return
    endif
    @"
    let @@ = saved_unnamed_register
endfunction