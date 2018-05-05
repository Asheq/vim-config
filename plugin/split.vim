" split.vim
" :SplitAbove, :SplitBelow, :SplitLeft, :SplitRight

" Recommended Mappings:
" nnoremap <silent> <leader>h :SplitLeft<CR>
" nnoremap <silent> <leader>j :SplitBelow<CR>
" nnoremap <silent> <leader>k :SplitAbove<CR>
" nnoremap <silent> <leader>l :SplitRight<CR>

command! SplitAbove call s:Split('above')
command! SplitBelow call s:Split('below')
command! SplitLeft  call s:Split('left')
command! SplitRight call s:Split('right')

function! s:Split(direction) abort
  let orig_splitright = &splitright
  let orig_splitbelow = &splitbelow

  if a:direction == 'left'
    set nosplitright
    vsplit
  elseif a:direction == 'below'
    set splitbelow
    split
  elseif a:direction == 'above'
    set nosplitbelow
    split
  elseif a:direction == 'right'
    set splitright
    vsplit
  endif

  let &splitright = orig_splitright
  let &splitbelow = orig_splitbelow
endfunction
