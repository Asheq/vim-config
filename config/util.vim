" vim: fdm=marker
" Contains helper functions

" Cache Directory " {{{
  function! s:EnsureExists(path)
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path), "p")
    endif
  endfunction

  function! GetCacheDir(suffix)
    let dir = resolve(expand(g:asheq#settings.cache_dir . '/' . a:suffix))
    call s:EnsureExists(dir)
    return dir
  endfunction
" }}}

" DiffOrig {{{
  command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
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

" Echo Syntax Info {{{
" Credit:
  function! EchoSyntaxInfo()
    echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'
  endfunction
" }}}

" Remove Repeated Empty Lines {{{
  function! RemoveRepeatedEmptyLines()
    %s/\n\{3,}/\r\r/e
  endfunction
" }}}

" Remove Commented Lines {{{
  function! RemoveCommentedLines()
    " TODO: Needs validation from testers
    let comment_regex = '\V\^\s\*' . substitute(&commentstring, '\V%s', '\\.\\*', '') . '\$'
    execute 'g/' . comment_regex . '/d'
  endfunction
" }}}

" TODO: Move the following into separate, plugin files
" ====================================================

" Source {{{
" Credit: Inspired by godlygeek/vim-files/plugin/vsearch.vim
  function! Source(visual_mode)
    echo 'Sourcing vimscript...'
    let temp = @"
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

" String Trailing White Space {{{
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
  " TODO: Turn this into a proper operator
  nnoremap gsie :StripTrailingWhitespaceAll<CR>
  nnoremap gsae :StripTrailingWhitespaceAll<CR>
  xnoremap gs   :<C-u>StripTrailingWhitespaceVisual<CR>
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
  endfunction
  nnoremap <silent> gr :set operatorfunc=<SID>GrepOperator<CR>g@
  xnoremap <silent> gr :<C-u>call <SID>GrepOperator(visualmode())<CR>
" }}}

" Change GUI Font Size {{{
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

" Open File in Chrome {{{
  function! s:OpenFileInChrome()
    if has('win32')
      execute '!start chrome ' . shellescape(expand('%:p'))
    elseif has('win32unix')
      execute '!cygstart chrome $(cygpath -w ' . shellescape(expand('%:p')) . ')'
    else
      echo 'Sorry, not setup for your environment yet'
    endif
  endfunction
  command! -nargs=0 OpenFileInChrome call s:OpenFileInChrome()
" }}}

" JsBeautify {{{
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
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    " Use this line instead of the above to match matches spanning across lines
    " let @/ = '\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
    call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
    let @@ = temp
  endfunction
" }}}
