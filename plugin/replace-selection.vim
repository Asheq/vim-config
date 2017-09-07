" replace-selection.vim
" Suggested Mapping: xnoremap x :<C-u>ReplaceSelection<CR>

command! ReplaceSelection call s:ReplaceSelection()

function! s:GetRawTextFromSelection()
  let temp = @@
  normal! gvy
  let raw_text = @@
  let @@ = temp
  return raw_text
endfunction

function! s:ReplaceSelection()

  let search_pattern = s:GetRawTextFromSelection()

  " Escape the escape character (\) and terminating character (/) so they are treated literally in
  " searches. Prepend \V to treat all other characters literally as well. Prepend \C to mind case.
  let search_pattern = escape(search_pattern, '\/')
  let search_pattern = '\C\V' . search_pattern

  " Some characters need to be represented by a friendly alias
  let search_pattern = substitute(search_pattern, '\n', '\\n', 'g')
  let search_pattern = substitute(search_pattern, '\r', '\\r', 'g')
  let search_pattern = substitute(search_pattern, '\e', '\\e', 'g')

  " Type out the substitute command
  call feedkeys(':%s/' . search_pattern . '//gc' . "\<Left>\<Left>\<Left>", 'n')
endfunction
