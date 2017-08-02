" edit.vim
" :Edit
" TODO-LOW: Support multiple files

command! -nargs=1
    \  Edit call s:Edit(<f-args>)

function! s:Edit(filename) abort
    let firstchar =  nr2char(strgetchar(a:filename, 0))

    if firstchar == "'"
        let filename = fnameescape(a:filename[1:strlen(a:filename)-2])
    else
        let filename = a:filename
    endif

    execute 'edit ' . filename

endfunction
