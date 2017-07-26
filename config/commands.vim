" commands.vim

" Command declarations {{{
  command! -nargs=1 DecreaseFontSize call s:DecreaseFontSize(<f-args>)
  command! -nargs=1 IncreaseFontSize call s:IncreaseFontSize(<f-args>)
  command! DiffOrig set splitright | vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
  command! DiffOrigAlt write !diff % -
  command! DiffOrigEnd bdelete | diffoff!
  command! PrettyPrintBufferList call s:PrettyPrintBufferList()
  command! ReplaceBufferWithSystemClipboard call s:ReplaceBufferWithSystemClipboard()
  command! ShowHighlightInfoUnderCursor call s:ShowHighlightInfoUnderCursor()
  command! SplitAbove call s:Split('above')
  command! SplitBelow call s:Split('below')
  command! SplitLeft  call s:Split('left')
  command! SplitRight call s:Split('right')
  command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()
" }}}

" Implementation functions {{{
  function! s:DecreaseFontSize(amount) abort
    call s:ChangeFontSize('-'.a:amount)
  endfunction

  function! s:IncreaseFontSize(amount) abort
    call s:ChangeFontSize('+'.a:amount)
  endfunction

  function! s:ChangeFontSize(delta) abort
    let new_font = substitute(&guifont,'\m\C\v(\d+)','\=submatch(0)'.a:delta,'')
    if has('nvim')
      execute 'GuiFont ' . new_font
    else
      execute 'set gfn=' . new_font
    endif
  endfunction

  function! s:PrettyPrintBufferList()
    call EchoWithColor('--- Buffer List ---', 'Title')
    ls
  endfunction

  function! s:ReplaceBufferWithSystemClipboard()
    normal gg"_dG"*p
    call EchoWithColor('Replaced buffer contents with system clipboard', 'WarningMsg')
  endfunction

  function! s:ShowHighlightInfoUnderCursor()
    echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
  endfunction

  function! s:Split(direction)
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

  function! s:ToggleFoldOpenCloseStrategy()
    if (&foldopen == 'all')
      let cmd = 'set foldopen& foldclose&'
    else
      let cmd = 'set foldopen=all foldclose=all'
    endif
    execute cmd
    echo cmd
  endfunction
" }}}

" vim: fdm=marker
