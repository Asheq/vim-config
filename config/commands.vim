" commands.vim

" Command declarations {{{
  command! Buffers call s:Buffers()
  command! ChangeDirectory call s:ChangeDirectory()
  command! DiffOrig call s:DiffOrig()
  command! DiffOrigAlt call s:DiffOrigAlt()
  command! DiffOrigEnd call s:DiffOrigEnd()
  command! Info call s:Info()
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
    echo ''
    redraw
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
    call EchoWithColor('--- Indicators ---', 'Title')
    call EchoWithColor('u  unlisted buffer', 'Normal')
    call EchoWithColor('%  buffer in current window', 'Normal')
    call EchoWithColor('#  alternate buffer', 'Normal')
    call EchoWithColor('a  active buffer: loaded and visible', 'Normal')
    call EchoWithColor('h  hidden buffer: loaded but not displayed in a window', 'Normal')
    call EchoWithColor('-  buffer with "modifiable" off', 'Normal')
    call EchoWithColor('=  readonly buffer', 'Normal')
    call EchoWithColor('+  modified buffer', 'Normal')
    call EchoWithColor("x  buffer with read errors\n\n", 'Normal')
  endfunction

  function! s:Buffers()
    call s:EchoBufferIndicators()
    call EchoWithColor('--- Working Directory ---', 'Title')
    call EchoWithColor('' . fnamemodify(getcwd(), ':~') . "\n\n", 'Normal')
    call EchoWithColor('--- Buffers ---', 'Title')
    ls
    echo ''
  endfunction

  function! s:Info()
    call EchoWithColor('       Working Directory: ', 'Title')
    call EchoWithColor(fnamemodify(getcwd(), ':~'), 'Normal', 1)
    call EchoWithColor('                  Buffer: ', 'Title')
    call EchoWithColor(fnamemodify(bufname('%'), ':~'), 'Normal', 1)
    call EchoWithColor('      Character Encoding: ', 'Title')
    call EchoWithColor(&fenc, 'Normal', 1)
    call EchoWithColor('             End of Line: ', 'Title')
    call EchoWithColor(&ff, 'Normal', 1)
    call EchoWithColor('          Tabs or Spaces: ', 'Title')
    call EchoWithColor(GetTabOrSpaces(), 'Normal', 1)
    call EchoWithColor('                Tab Size: ', 'Title')
    call EchoWithColor(&tabstop, 'Normal', 1)
    call EchoWithColor('                Filetype: ', 'Title')
    call EchoWithColor(&filetype, 'Normal', 1)
  endfunction

  function! s:ShowHighlightInfoUnderCursor()
    echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
  endfunction

  function! s:ToggleFoldOpenCloseStrategy()
    if (&foldopen == 'all')
      let cmd = ':set foldopen& foldclose&'
    else
      let cmd = ':set foldopen=all foldclose=all'
    endif
    call feedkeys(cmd . "\<CR>")
  endfunction

" }}}

" vim: fdm=marker
