" buffer-close-dialog.vim
" Provides a command called 'BufferCloseDialog'
" that displays an interactive dialog/menu to close buffers
" Author:	Asheq Imran <https://github.com/Asheq>
" License:	Same license as Vim itself
" Last Change:	

if exists("g:loaded_buffer_close_dialog")
    finish
endif
let g:loaded_buffer_close_dialog = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:DeleteBuffers(buffer_numbers)
    let deleted_count = 0
    for buffer_number in a:buffer_numbers
        if buflisted(buffer_number)
            try
                execute 'bdelete ' . buffer_number
            catch
            endtry
            if !buflisted(buffer_number)
                let deleted_count += 1
            endif
        endif
    endfor
    return deleted_count
endfunction

function! s:BufferCloseDialog()
    call s:PrettyPrintBufferList()
    call s:EchoWithHighlightColor('Close buffer?', 'Question')
    call s:EchoWithHighlightColor('(C)ancel  (T)his  (A)ll  (O)ther  (S)elect (N)ameless: ', 'Question')
    let answer_is_invalid = 1
    while answer_is_invalid
        let answer = nr2char(getchar())
        let answer_is_invalid = 0
        if tolower(answer) == 't'
            bdelete!
            redraw
        elseif tolower(answer) == 'a'
            let buffer_numbers = range(1, bufnr('$'))
            let deleted_count = s:DeleteBuffers(buffer_numbers)
            redraw
            call s:EchoWithHighlightColor('All buffers deleted (' . deleted_count . ')' , 'WarningMsg')
        elseif tolower(answer) == 'o'
            let current_buffer_number = bufnr('%')
            let max_buffer_number = bufnr('$')
            let buffer_numbers = []
            let i = 1
            while i <= max_buffer_number
                if i != current_buffer_number
                    let buffer_numbers = add(buffer_numbers, i)
                endif
                let i += 1
            endwhile
            let deleted_count = s:DeleteBuffers(buffer_numbers)
            redraw
            call s:EchoWithHighlightColor('Other buffers deleted (' . deleted_count . ')', 'WarningMsg')
        elseif tolower(answer) == 's'
            let buffer_numbers = input('Type space-seperated buffer numbers and <Enter>: ')
            let deleted_count = s:DeleteBuffers(map(split(buffer_numbers), 'str2nr(v:val)'))
            redraw
            call s:EchoWithHighlightColor('Selected buffers deleted (' . deleted_count . ')', 'WarningMsg')
        elseif tolower(answer) == 'n'
            let max_buffer_number = bufnr('$')
            let buffer_numbers = []
            let i = 1
            while i <= max_buffer_number
                if bufname(i) == ''
                    let buffer_numbers = add(buffer_numbers, i)
                endif
                let i += 1
            endwhile
            let deleted_count = s:DeleteBuffers(buffer_numbers)
            redraw
            call s:EchoWithHighlightColor('Nameless buffers deleted (' . deleted_count . ')', 'WarningMsg')
        elseif tolower(answer) == 'c'
            redraw
        else
            let answer_is_invalid = 1
        endif
    endwhile
endfunction

if !exists(':BufferCloseDialog')
    command BufferCloseDialog call s:BufferCloseDialog()
endif

" Auxiliary functions
" ======================================================================

function! s:PrettyPrintBufferList()
    call s:EchoWithHighlightColor('--- Buffer List ---', 'Title')
    ls
endfunction

function! s:EchoWithHighlightColor(msg, highlight_group)
    execute "echohl " . a:highlight_group
    execute "echo '" . a:msg . "'"
    execute "echohl Normal"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
