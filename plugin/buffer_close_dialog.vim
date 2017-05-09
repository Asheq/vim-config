" buffer_close_dialog.vim
" Lightweight Vim plugin that provides a command called 'BufferCloseDialog'
" that displays an interactive dialog/menu to close buffers
" Author:	Asheq Imran <https://github.com/Asheq>
" License:	Same license as Vim itself
" Last Change:	2017 May 05

if exists("g:buffer_close_dialog") || &cp || v:version < 700
    finish
endif
let g:buffer_close_dialog = 1

function! s:BufferCloseDialog()
    call s:PrettyPrintBufferList()
    call EchoWithHighlight('Close buffer?', 'Question')
    call EchoWithHighlight('(C)ancel  (T)his  (A)ll  (O)ther  (S)elect: ', 'Question')
    let answerIsInvalid = 1
    while answerIsInvalid
        let answer = nr2char(getchar())
        let answerIsInvalid = 0
        if tolower(answer) == 't'
            bdelete!
            redraw
        elseif tolower(answer) == 'a'
            let bufferNumbers = range(1, bufnr('$'))
            let deletedCount = s:DeleteBuffers(bufferNumbers)
            redraw
            call EchoWithHighlight('All buffers deleted (' . deletedCount . ')' , 'WarningMsg')
        elseif tolower(answer) == 'o'
            let currentBufferNumber = bufnr('%')
            let maxBufferNumber = bufnr('$')
            let bufferNumbers = []
            let i = 1
            while i <= maxBufferNumber
                if i != currentBufferNumber
                    let bufferNumbers = add(bufferNumbers, i)
                endif
                let i += 1
            endwhile
            let deletedCount = s:DeleteBuffers(bufferNumbers)
            redraw
            call EchoWithHighlight('Other buffers deleted (' . deletedCount . ')', 'WarningMsg')
        elseif tolower(answer) == 's'
            let bufferNumbers = input('Type space-seperated buffer numbers and <Enter>: ')
            let deletedCount = s:DeleteBuffers(map(split(bufferNumbers), 'str2nr(v:val)'))
            redraw
            call EchoWithHighlight('Selected buffers deleted (' . deletedCount . ')', 'WarningMsg')
        elseif tolower(answer) == 'c'
            redraw
        else
            let answerIsInvalid = 1
        endif
    endwhile
endfunction

command! BufferCloseDialog call s:BufferCloseDialog()

function! s:PrettyPrintBufferList()
    call EchoWithHighlight('--- Buffer List ---', 'Title')
    ls
endfunction

command! PrettyPrintBufferList call s:PrettyPrintBufferList()

function! s:DeleteBuffers(bufferNumbers)
    let deletedCount = 0
    for bufferNumber in a:bufferNumbers
        if buflisted(bufferNumber)
            execute 'bdelete! ' . bufferNumber
            if !buflisted(bufferNumber)
                let deletedCount += 1
            endif
        endif
    endfor
    return deletedCount
endfunction

function! s:EchoWithHighlight(msg, highlightGroup)
    execute "echohl " . a:highlightGroup
    execute "echo '" . a:msg . "'"
    execute "echohl Normal"
endfunction

if !hasmapto('<Plug>BufferCloseDialgo')
  map <unique> <silent> Q :BufferCloseDialog<CR>
endif