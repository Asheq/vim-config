" drop.vim
" :Drop
" TODO: Support multiple files

command! -nargs=1
      \  Drop call s:Drop(<f-args>)

function! s:Drop(filename) abort
  let firstchar =  nr2char(strgetchar(a:filename, 0))

  if firstchar == "'"
    let filename = fnameescape(a:filename[1:strlen(a:filename)-2])
  else
    let filename = a:filename
  endif

  let filename = fnamemodify(filename, ":.")

  execute 'edit ' . filename

endfunction
