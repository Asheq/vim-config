" I'm using this, I have this function in autoload/functions.vim

function! functions#sourceProjectConfig() abort
  let l:projectfile = findfile('.local.vim', expand('%:p').';')
  if filereadable(l:projectfile)
    silent execute 'source' l:projectfile
  endif
endfunction

" and I call it like this

augroup LocalVimrc
  autocmd!
  autocmd BufRead,BufNewFile * call functions#sourceProjectConfig()

  if has('nvim')
    autocmd DirChanged * call functions#sourceProjectConfig()
  endif
augroup END
