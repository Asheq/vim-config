" rainbow
" ----------------------------------------------------------------------------
let g:rainbow_active = 1

" context
" ----------------------------------------------------------------------------
let g:context_enabled = 0

" sandwich
" ----------------------------------------------------------------------------
let g:textobj_sandwich_no_default_key_mappings = 1

" dirvish
" ----------------------------------------------------------------------------
augroup dirvish_config
  autocmd!

  " Map `t` to open in new tab
  autocmd FileType dirvish
    \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
    \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
augroup END

" markdown
" ----------------------------------------------------------------------------
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
