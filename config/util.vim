" vim: fdm=marker

" TODO: Split into separate, appropriate files/folders.

" Cache Directory " {{{
  function! s:EnsureExists(path)
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path))
    endif
  endfunction

  function! GetCacheDir(suffix)
    call s:EnsureExists(g:asheq#settings.cache_dir)
    let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
    call s:EnsureExists(dir)
    return dir
  endfunction
 " }}}

" Preserve {{{
  function! s:Preserve(cmd)
    " Save state
    let l:win_view = winsaveview()
    let l:last_search = getreg('/')

    " Execute the cmd without adding to the changelist or jumplist
    execute 'keepjumps ' . a:cmd

    " Restore state
    call winrestview(l:win_view)
    call setreg('/', l:last_search)
  endfunction
" }}}

" String Trailing White Space {{{
  function! s:StripTrailingWhitespaceAll()
    call s:Preserve('%s/\s\+$//e')
  endfunction

  function! s:StripTrailingWhitespaceVisual()
    '<,'>s/\s\+$//e
  endfunction

  command! StripTrailingWhitespaceAll call s:StripTrailingWhitespaceAll()
  command! StripTrailingWhitespaceVisual call s:StripTrailingWhitespaceVisual()
" }}}

" Font Size {{{
  function! s:ChangeFontSize(delta) abort
    let new_font = substitute(&guifont,'\v(\d+)','\=submatch(0)'.a:delta,'')
    if has('nvim')
      execute 'GuiFont ' . new_font
    else
      execute 'set gfn=' . new_font
    endif
  endfunction

  function! s:DecreaseFontSize(amount) abort
    call s:ChangeFontSize('-'.a:amount)
  endfunction

  function! s:IncreaseFontSize(amount) abort
    call s:ChangeFontSize('+'.a:amount)
  endfunction

  command! -nargs=1 DecreaseFontSize call s:DecreaseFontSize(<f-args>)
  command! -nargs=1 IncreaseFontSize call s:IncreaseFontSize(<f-args>)
" }}}

" Execute Macro over Visual Range " {{{
  function! ExecuteMacroOverVisualRange()
    echo '@'.getcmdline()
    execute ":'<,'>normal! @".nr2char(getchar())
  endfunction
" }}}

" Search using Visual Selection " {{{
  function! VSetSearch()
    " from godlygeek/vim-files/plugin/vsearch.vim
    let temp = @@
    normal! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    " Use this line instead of the above to match matches spanning across lines
    " let @/ = '\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
    call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
    let @@ = temp
  endfunction
" }}}

" Source {{{
  function! Source(visual_mode)
    echo 'Sourcing vimscript...'
    let temp = @@
    if a:visual_mode
      silent normal! gvy
    else
      silent normal! yy
    endif
    @"
    let @" = temp
    echo 'Done sourcing vimscript!'
  endfunction
" }}}

" Open File in Chrome {{{
  function! s:OpenFileInChrome()
    if has('win32')
      execute '!start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ' . shellescape(expand('%:p'))
    endif
  endfunction

  command! -nargs=0 OpenFileInChrome call s:OpenFileInChrome()
" }}}

" Toggle options foldopen and foldclose {{{
  function! ToggleFoldOpenFoldCloseStrategy()
    if (&foldopen == 'all')
      let cmd = 'set foldopen& foldclose&'
    else
      let cmd = 'set foldopen=all foldclose=all'
    endif
      execute cmd
      echo cmd
  endfunction
" }}}

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

    " Run js-beautify
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

" Delete Buffers {{{
  function! s:DeleteBuffers()
    ls
    echo '────────────────────────────────────────────────────────────'
    echo '[c]ancel  [t]his  [a]ll  [o]ther  [s]elect: '
    let answer = nr2char(getchar())
    if tolower(answer) == 't'
      bdelete!
      redraw
    elseif tolower(answer) == 'a'
      bufdo bdelete!
      redraw
    elseif tolower(answer) == 'o'
      echo 'Action not yet supported'
    elseif tolower(answer) == 's'
      let buffer_list = input('bdelete! ')
      execute 'bdelete! ' . buffer_list
      redraw
    else
      redraw
    endif
  endfunction

  command! DeleteBuffers call s:DeleteBuffers()
" }}}

