" vim: fdm=marker

" TODO: Split into separate, appropriate files/folders. Refactor.

function EnsureExists(path) " {{{
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction " }}}

function GetCacheDir(suffix) " {{{
  call EnsureExists(g:asheq#settings.cache_dir)
  let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
  call EnsureExists(dir)
  return dir
endfunction " }}}

function Preserve(cmd) " {{{
  " Save state
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')

  " Execute the cmd without adding to the changelist or jumplist
  execute 'keepjumps ' . a:cmd

  " Restore state
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction " }}}

function StripTrailingWhitespaceAll() " {{{
  call Preserve('%s/\s\+$//e')
endfunction " }}}

function StripTrailingWhitespaceVisual() " {{{
  '<,'>s/\s\+$//e
endfunction " }}}

function DecreaseFontSize(amount) abort " {{{
  call ChangeFontSize('-'.a:amount)
endfunction " }}}

function IncreaseFontSize(amount) abort " {{{
  call ChangeFontSize('+'.a:amount)
endfunction " }}}

function ChangeFontSize(delta) abort " {{{
  let new_font = substitute(&guifont,'\v(\d+)','\=submatch(0)'.a:delta,'')
  if has('nvim')
    execute 'GuiFont ' . new_font
  else
    execute 'set gfn=' . new_font
  endif
endfunction " }}}

function! ExecuteMacroOverVisualRange() " {{{
  echo '@'.getcmdline()
  execute ":'<,'>normal! @".nr2char(getchar())
endfunction " }}}

function! VSetSearch() " {{{
  " from godlygeek/vim-files/plugin/vsearch.vim
  let temp = @@
  normal! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  " Use this line instead of the above to match matches spanning across lines
  " let @/ = '\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = temp
endfunction " }}}

function Source(begin, end) " {{{
  let lines = getline(a:begin, a:end)
  for line in lines
    execute line
    echo 'Sourced line: ' . line
  endfor
endfunction " }}}

function! OpenFileInChrome() " {{{
  if has('win32')
    execute '!start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" %:p'
  endif
endfunction " }}}

function! ToggleFoldOpenFoldCloseStrategy() " {{{
  if (&foldopen == 'all')
    let cmd = 'set foldopen& foldclose&'
  else
    let cmd = 'set foldopen=all foldclose=all'
  endif
    execute cmd
    echo cmd
endfunction " }}}

" DiffOrig {{{
  command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
" }}}

" JsBeautify {{{
  function! s:JsBeautify() range abort
    if !executable('js-beautify')
      throw "js-beautify is not available"
    endif

    " Set current working directory to directory of current file
    cd %:p:h
    let ft = &filetype
    let cmd = [
          \ '!js-beautify',
          \ '--editorconfig',
          \ '--type',
          \ ft,
          \ ]
    execute a:firstline . ',' . a:lastline . join(cmd)

    " Reset current working directory
    cd -
  endfunction

  augroup jsbeautify
    autocmd!
    autocmd FileType css,html,javascript,json
          \ command! -nargs=0 -range=% -buffer JsBeautify <line1>,<line2>call s:JsBeautify()
  augroup END
" }}}

function! AreYouSure(msg) " {{{
  echo a:msg
  echo '[y]es, [c]ancel: '
  let answer = nr2char(getchar())
  redraw
  if tolower(answer) == 'y'
    return 1
  endif
  return 0
endfunction " }}}

function! DeleteOneBuffer() " {{{
  if AreYouSure('Delete buffer?')
    Bdelete!
  endif
endfunction " }}}

function! DeleteAllBuffers() " {{{
  if AreYouSure('Delete ALL buffers?')
    bufdo bdelete!
  endif
endfunction " }}}
