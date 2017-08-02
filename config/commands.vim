" commands.vim

" Command declarations {{{
  command! DiffOrig call s:DiffOrig()
  command! DiffOrigAlt call s:DiffOrigAlt()
  command! DiffOrigEnd call s:DiffOrigEnd()
  command! PrettyPrintBufferList call s:PrettyPrintBufferList()
  command! ReplaceBufferWithSystemClipboard call s:ReplaceBufferWithSystemClipboard()
  command! ShowHighlightInfoUnderCursor call s:ShowHighlightInfoUnderCursor()
  command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()
" }}}

" Implementation functions {{{
  function! s:DiffOrig()
    set splitright
    vert new
    set bt=nofile
    r ++edit #
    0d_
    diffthis
    wincmd p
    diffthis
  endfunction

  function s:DiffOrigAlt()
    write !diff % -
  endfunction

  function s:DiffOrigEnd()
    bdelete | diffoff!
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
