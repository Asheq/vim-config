" rainbow
" ----------------------------------------------------------------------------
let g:rainbow_active = 1

" context
" ----------------------------------------------------------------------------
let g:context_enabled = 0

" sandwich
" ----------------------------------------------------------------------------
let g:textobj_sandwich_no_default_key_mappings = 1

" firenvvim
" ----------------------------------------------------------------------------
function! s:IsFirenvimActive(event) abort
  if !exists('*nvim_get_chan_info')
    return 0
  endif
  let l:ui = nvim_get_chan_info(a:event.chan)
  return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
      \ l:ui.client.name =~? 'Firenvim'
endfunction

function! OnUIEnter(event) abort
  if s:IsFirenvimActive(a:event)
    set laststatus=0
    set guifont=Iosevka:h12
  endif
endfunction
autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

" dirvish
" ----------------------------------------------------------------------------
augroup dirvish_config
  autocmd!

  " Map `t` to open in new tab.
  autocmd FileType dirvish
    \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
    \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
augroup END
