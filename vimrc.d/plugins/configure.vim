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

" coc
" ----------------------------------------------------------------------------
" TextEdit might fail if hidden is not set.
" TODO: Is this really important?
" set hidden

" Some servers have issues with backup files, see #649.
" TODO: Is this really important?
" set nobackup
" set nowritebackup

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
