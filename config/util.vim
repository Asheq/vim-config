" vim: fdm=marker

function EnsureExists(path) " {{{
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path))
  endif
endfunction " }}}

function GetCacheDir(suffix) " {{{
  return resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
endfunction " }}}

function Preserve(command) " {{{
  " Save state
  let l:win_view = winsaveview()
  let l:last_search = getreg('/')

  " Execute the command without adding to the changelist or jumplist
  execute 'keepjumps ' . a:command

  " Restore state
  call winrestview(l:win_view)
  call setreg('/', l:last_search)
endfunction " }}}

function FormatEntireFile() " {{{
  call Preserve('normal! gg=G')
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

function! CommandOutputInBuffer(cmd) " {{{
  " TODO: Make Foolproof
  " TODO: Make into a command-line command, not simply a function
  enew
  execute 'file [' . a:cmd . '] (id: ' . bufnr("%") . ')'
  setlocal bufhidden=hide buflisted buftype=nofile noswapfile
  let temp = @x
  redir @x
  execute 'silent ' . a:cmd
  normal! "xp
  redir END
  let @x = temp
endfunction " }}}

function! ToggleFoldOpenFoldCloseStrategy() " {{{
  if (&foldopen == 'all')
    let command = 'set foldopen& foldclose&'
  else
    let command = 'set foldopen=all foldclose=all'
  endif
    execute command
    echo command
endfunction " }}}

" DiffOrig {{{
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
" }}}
