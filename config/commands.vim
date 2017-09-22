" commands.vim

" Command declarations {{{
  command! Buffers call s:Buffers()
  command! ChangeDirectory call s:ChangeDirectory()
  command! DiffOrig call s:DiffOrig()
  command! DiffOrigAlt call s:DiffOrigAlt()
  command! DiffOrigEnd call s:DiffOrigEnd()
  command! Info call s:Info()
  command! ReplaceBufferWithSystemClipboard call s:ReplaceBufferWithSystemClipboard()
  command! ShowHighlightInfoUnderCursor call s:ShowHighlightInfoUnderCursor()
  command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()
" }}}

" Implementation functions {{{

  function! s:ChangeDirectory()
    call EchoWithColor('Change directory?', 'Question')
    call EchoWithColor('[G]lobally, (L)ocally, (C)ancel: ', 'Question')
    let answer = tolower(nr2char(getchar()))

    if answer == 'c'
      return
    endif

    let prefix = ''
    if answer == 'l'
      let prefix = 'l'
    endif
    execute prefix . 'cd %:h'

  endfunction

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

  function! s:DiffOrigAlt()
    write !diff % -
  endfunction

  function! s:DiffOrigEnd()
    bdelete | diffoff!
  endfunction

  function! s:EchoBufferIndicators()
    call EchoWithColor('--- Indicators ---', 'Identifier')
    call EchoWithColor('u  an unlisted buffer', 'Title')
    call EchoWithColor('%  the buffer in the current window', 'Title')
    call EchoWithColor('#  the alternate buffer', 'Title')
    call EchoWithColor('a  an active buffer: it is loaded and visible', 'Title')
    call EchoWithColor('h  a hidden buffer: It is loaded, but currently not', 'Title')
    call EchoWithColor('-  a buffer with "modifiable" off', 'Title')
    call EchoWithColor('=  a readonly buffer', 'Title')
    call EchoWithColor('+  a modified buffer', 'Title')
    call EchoWithColor("x  a buffer with read errors\n\n", 'Title')
  endfunction

  function! s:Buffers()
    call s:EchoBufferIndicators()
    call EchoWithColor('--- Working Directory ---', 'Identifier')
    call EchoWithColor('' . getcwd() . "\n\n", 'Title')
    call EchoWithColor('--- Buffers ---', 'Identifier')
    ls
  endfunction

  function! s:Info()
    call EchoWithColor('       Working Directory: ', 'Identifier')
    call EchoWithColor(getcwd(), 'Normal', 1)
    call EchoWithColor('             Buffer Name: ', 'Identifier')
    call EchoWithColor(bufname('%'), 'Normal', 1)
    call EchoWithColor('      Character Encoding: ', 'Identifier')
    call EchoWithColor(&fenc, 'Normal', 1)
    call EchoWithColor('             End of Line: ', 'Identifier')
    call EchoWithColor(&ff, 'Normal', 1)
    call EchoWithColor('          Tabs or Spaces: ', 'Identifier')
    call EchoWithColor(GetTabOrSpaces(), 'Normal', 1)
    call EchoWithColor('                Tab Size: ', 'Identifier')
    call EchoWithColor(&tabstop, 'Normal', 1)
    call EchoWithColor('                Filetype: ', 'Identifier')
    call EchoWithColor(&filetype, 'Normal', 1)
  endfunction

  function! s:ReplaceBufferWithSystemClipboard()
    normal gg"_dG"*p
    call EchoWithColor('Buffer now has contents of system clipboard', 'WarningMsg')
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
