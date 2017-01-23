" vim: fdm=marker

" Other {{{
  " Since semi-colon is used to initiate command-line
  map : <Plug>Sneak_;
  nmap <silent> cog <Plug>IndentGuidesToggle
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
  nnoremap <silent> Q :echo 'Do you really need to close this buffer? I doubt it! If you really do, use !Q'<CR>
  nnoremap <silent> !Q :Bdelete!<CR>
  let g:wordmotion_mappings = {
              \ 'w' : 'gw',
              \ 'b' : 'gb',
              \ 'e' : 'ge',
              \ 'aw' : 'agw',
              \ 'iw' : 'igw'
              \ }
" }}}

" Dirvish {{{
  " Look at directory of current file
  nnoremap <leader>l :Dirvish %<CR>
  " eXplore current working directory
  nnoremap <leader>x :Dirvish<CR>

  augroup my_dirvish_events
    autocmd!
    autocmd FileType dirvish nnoremap <buffer>
      \ gh :echo 'Sample Dirvish Mapping - gh'<CR>
    autocmd FileType dirvish nnoremap <buffer>
      \ gx :echo 'Sample Dirvish Mapping - gx'<CR>
  augroup END
" }}}

" JsBeautify {{{
  autocmd FileType css noremap <buffer> <leader><Space> :call CSSBeautify()<CR>
  autocmd FileType css vnoremap <buffer> <leader><Space> :call RangeCSSBeautify()<CR>
  autocmd FileType html noremap <buffer> <leader><Space> :call HtmlBeautify()<CR>
  autocmd FileType html vnoremap <buffer> <leader><Space> :call RangeHtmlBeautify()<CR>
  autocmd FileType javascript noremap <buffer> <leader><Space> :call JsBeautify()<CR>
  autocmd FileType javascript vnoremap <buffer> <leader><Space> :call RangeJsBeautify()<CR>
  autocmd FileType json noremap <buffer> <leader><Space> :call JsonBeautify()<CR>
  autocmd FileType json vnoremap <buffer> <leader><Space> :call RangeJsonBeautify()<CR>
  autocmd FileType jsx noremap <buffer> <leader><Space> :call JsxBeautify()<CR>
  autocmd FileType jsx vnoremap <buffer> <leader><Space> :call RangeJsxBeautify()<CR>
  autocmd FileType scss noremap <buffer> <leader><Space> :call CSSBeautify()<CR>
  autocmd FileType scss vnoremap <buffer> <leader><Space> :call RangeCSSBeautify()<CR>
" }}}

" Denite {{{
  nnoremap [denite] <Nop>
  xnoremap [denite] <Nop>
  nmap \ [denite]
  xmap \ [denite]

  " nnoremap <silent> [denite]*       :DeniteCursorWord line<CR> 
  " nnoremap <silent> [denite]/       :Denite line<CR>
  " nnoremap <silent> [denite]<Space> :Denite file_rec<CR>
  " nnoremap <silent> [denite]b       :Denite buffer<CR>
  " nnoremap [denite]:                :Denite unite:output:
  nnoremap <silent> [denite]\       :Denite -resume<CR>
  nnoremap <silent> [denite]f       :Denite filetype<CR>
  nnoremap <silent> [denite]m       :Denite menu<CR>
  nnoremap <silent> [denite]r       :Denite file_mru<CR>
" }}}

" Mappings within Denite buffer " {{{
  call denite#custom#map(
        \ 'insert',
        \ '<Tab>',
        \ '<denite:move_to_next_line>',
        \ 'noremap'
        \)
  call denite#custom#map(
        \ 'insert',
        \ '<S-Tab>',
        \ '<denite:move_to_previous_line>',
        \ 'noremap'
        \)
" }}}
