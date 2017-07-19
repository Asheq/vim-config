" util.vim

" Programming Helper Functions {{{
  function! GetCacheDir(suffix)
    let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
    call s:EnsureExists(dir)
    return dir
  endfunction

  function! EchoWithColor(msg, highlightGroup)
      execute "echohl " . a:highlightGroup
      execute "echo '" . a:msg . "'"
      execute "echohl Normal"
  endfunction

  function! s:EnsureExists(path)
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path), "p")
    endif
  endfunction

" }}}

" Simple User Commands {{{

  " Command Declarations {{{
    command! DiffOrig set splitright | vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis 
    command! DiffOrigAlt write !diff % -
    command! DiffOrigEnd bdelete | diffoff!
    command! ReplaceBufferWithSystemClipboard call s:ReplaceBufferWithSystemClipboard()
    command! PrettyPrintBufferList call s:PrettyPrintBufferList()
    command! ShowHighlightInfoUnderCursor call s:ShowHighlightInfoUnderCursor()
    command! DirvishInCurrentFileDirectory call s:DirvishInCurrentFileDirectory()
    command! ToggleFoldOpenCloseStrategy call s:ToggleFoldOpenCloseStrategy()
    command! -nargs=1 DecreaseFontSize call s:DecreaseFontSize(<f-args>)
    command! -nargs=1 IncreaseFontSize call s:IncreaseFontSize(<f-args>)
    command! OpenBrowserCurrent call s:OpenBrowserCurrent()
  " }}}

  " Implementation functions {{{

  function! s:OpenBrowserCurrent()
      if has('win32unix')
        " TODO
        echo "TODO ..."
    endif
  endfunction

  function! s:ChangeFontSize(delta) abort
    let new_font = substitute(&guifont,'\m\C\v(\d+)','\=submatch(0)'.a:delta,'')
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

  function! s:ReplaceBufferWithSystemClipboard()
    normal gg"_dG"*p
    call EchoWithColor('Replaced buffer contents with system clipboard', 'WarningMsg')
  endfunction

  function! s:PrettyPrintBufferList()
    call EchoWithColor('--- Buffer List ---', 'Title')
    ls
  endfunction

  function! s:ShowHighlightInfoUnderCursor()
    echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
  endfunction

  function! s:DirvishInCurrentFileDirectory()
    if expand('%') == ''
      Dirvish
    else
      Dirvish %
    endif
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

" }}}

" Operators {{{

  " Define {{{
    function! Define(visual_mode)
      if !a:visual_mode
        execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . expand("<cword>")
      else
        let temp = @"
        silent normal! gvy
        execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . @"
        let @" = temp
      endif
    endfunction
  " }}}

  " Grep {{{
  " Credit:
    function! s:GrepOperator(type)
      let saved_unnamed_register = @@
      if a:type ==# 'v'
        normal! `<v`>y
      elseif a:type ==# 'char'
        normal! `[v`]y
      else
        return
      endif
      silent execute "grep! " . shellescape(@@, 1)
      let @@ = saved_unnamed_register
      redraw!
    endfunction
    nnoremap <silent> gr :set operatorfunc=<SID>GrepOperator<CR>g@
    xnoremap <silent> gr :<C-u>call <SID>GrepOperator(visualmode())<CR>
  " }}}

  " To New Buffer {{{
  function! s:VisualSelectionToNewBuffer()
    let ft = &ft
    let temp = @"
    silent normal! gvy
    set splitbelow
    split
    enew
    let &ft = ft
    normal! Vp
    let @" = temp
  endfunction
  command! VisualSelectionToNewBuffer call s:VisualSelectionToNewBuffer()
  " }}}

  " Source Vimscript {{{
    function! s:SourceVimscriptOperator(type)
      let saved_unnamed_register = @@
      if a:type ==# 'v' || a:type ==# 'V'
        normal! gvy
      elseif a:type ==# 'char'
        normal! `[v`]y
      elseif a:type ==# 'line'
        normal! `[V`]y
      else
        return
      endif
      @"
      call EchoWithColor('Sourced vimscript', 'WarningMsg')
      let @@ = saved_unnamed_register
    endfunction
    nnoremap <silent> \s  :set operatorfunc=<SID>SourceVimscriptOperator<CR>g@
    nnoremap <silent> \ss :set operatorfunc=<SID>SourceVimscriptOperator<Bar>execute 'normal! 'v:count1.'g@_'<CR>
    xnoremap <silent> \s  :<C-u>call <SID>SourceVimscriptOperator(visualmode())<CR>
    " }}}

  " Remove Repeated Empty Lines or Commented Lines {{{
    function! s:RemoveRepeatedEmptyLines()
      %s/\n\{3,}/\r\r/e
    endfunction
    command! RemoveRepeatedEmptyLines call s:RemoveRepeatedEmptyLines()

    function! s:RemoveCommentedLines()
      let comment_regex = '\m\C\V\^\s\*' . substitute(&commentstring, '\m\C\V%s', '\\.\\*', '') . '\$'
      execute 'g/' . comment_regex . '/d'
    endfunction
    command! RemoveCommentedLines call s:RemoveCommentedLines()
  " }}}

  " Strip Trailing White Space {{{
  " Credit:
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

    function! s:StripTrailingWhitespaceAll()
      call s:Preserve('%s/\s\+$//e')
    endfunction

    function! s:StripTrailingWhitespaceVisual()
      '<,'>s/\s\+$//e
    endfunction
    command! StripTrailingWhitespaceAll call s:StripTrailingWhitespaceAll()
    command! StripTrailingWhitespaceVisual call s:StripTrailingWhitespaceVisual()
    nnoremap gsie :StripTrailingWhitespaceAll<CR>
    nnoremap gsae :StripTrailingWhitespaceAll<CR>
    xnoremap gs   :<C-u>StripTrailingWhitespaceVisual<CR>
  " }}}
" }}}

" JsBeautify Command {{{
" Credit:
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

" Mappings {{{
  " Repeat or Execute Macro over Visual Range " {{{
  " Credit:
  xnoremap . :normal! .<CR>
  xnoremap @ :call ExecuteMacroOverRange()<CR>

  function! ExecuteMacroOverRange() range
    echo '@'.getcmdline()
    execute ":" . a:firstline . "," . a:lastline . "normal! @" . nr2char(getchar())
  endfunction
  " }}}

  " Search using Visual Selection " {{{
  " Credit:
  xnoremap * :<C-u>call VSetSearch()<CR>/<CR>
  xnoremap # :<C-u>call VSetSearch()<CR>?<CR>

  function! VSetSearch()
    " from godlygeek/vim-files/plugin/vsearch.vim
    let temp = @@
    normal! gvy
    let @/ = '\m\C\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    " Use this line instead of the above to match matches spanning across lines
    " let @/ = '\m\C\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
    call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
    let @@ = temp
  endfunction
  " }}}
" }}}

" vim: fdm=marker
