" source-vimscript-operator.vim
" Source vimscript

" TODO-HIGH: Allow mappings to be configured by user

nnoremap <silent> \s  :set operatorfunc=<SID>SourceVimscriptOperator<CR>g@
nnoremap <silent> \ss :set operatorfunc=<SID>SourceVimscriptOperator<Bar>execute 'normal! 'v:count1.'g@_'<CR>
xnoremap <silent> \s  :<C-u>call <SID>SourceVimscriptOperator(visualmode())<CR>

function! s:SourceVimscriptOperator(type)
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
