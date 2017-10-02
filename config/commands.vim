" commands.vim

 " TODO: organize

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
    call vimrc#EchoWithColor('Change directory?', 'Question')
    call vimrc#EchoWithColor('[G]lobally, (L)ocally, (C)ancel: ', 'Question')
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
    call vimrc#EchoWithColor('--- Indicators ---', 'Title')
    call vimrc#EchoWithColor('u  unlisted buffer', 'Normal')
    call vimrc#EchoWithColor('%  buffer in current window', 'Normal')
    call vimrc#EchoWithColor('#  alternate buffer', 'Normal')
    call vimrc#EchoWithColor('a  active buffer: loaded and visible', 'Normal')
    call vimrc#EchoWithColor('h  hidden buffer: loaded but not displayed in a window', 'Normal')
    call vimrc#EchoWithColor('-  buffer with "modifiable" off', 'Normal')
    call vimrc#EchoWithColor('=  readonly buffer', 'Normal')
    call vimrc#EchoWithColor('+  modified buffer', 'Normal')
    call vimrc#EchoWithColor("x  buffer with read errors\n\n", 'Normal')
  endfunction

  function! s:Buffers()
    call s:EchoBufferIndicators()
    call vimrc#EchoWithColor('--- Working Directory ---', 'Title')
    call vimrc#EchoWithColor('    ' . fnamemodify(getcwd(), ':~') . "\n\n", 'Normal')
    call vimrc#EchoWithColor('--- Buffers ---', 'Title')
    ls
    echo ''
  endfunction

  function! s:Info()
    call vimrc#EchoWithColor('       Working Directory: ', 'Title')
    call vimrc#EchoWithColor(fnamemodify(getcwd(), ':~'), 'Normal', 1)
    call vimrc#EchoWithColor('                  Buffer: ', 'Title')
    call vimrc#EchoWithColor(fnamemodify(bufname('%'), ':~'), 'Normal', 1)
    call vimrc#EchoWithColor('      Character Encoding: ', 'Title')
    call vimrc#EchoWithColor(&fenc, 'Normal', 1)
    call vimrc#EchoWithColor('             End of Line: ', 'Title')
    call vimrc#EchoWithColor(&ff, 'Normal', 1)
    call vimrc#EchoWithColor('          Tabs or Spaces: ', 'Title')
    call vimrc#EchoWithColor(&expandtab ? 'Spaces' : 'Tabs', 'Normal', 1)
    call vimrc#EchoWithColor('                Tab Size: ', 'Title')
    call vimrc#EchoWithColor(&tabstop, 'Normal', 1)
    call vimrc#EchoWithColor('                Filetype: ', 'Title')
    call vimrc#EchoWithColor(&filetype, 'Normal', 1)
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
