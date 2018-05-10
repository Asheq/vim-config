" replace-selection.vim
" TODO: Turn into an operator
" Recommended Mapping: xnoremap X :<C-u>ReplaceSelection<CR>

command! ReplaceSelection call s:ReplaceSelection()

" Returns raw text from current visual selection without clobbering any registers
function! s:GetRawTextFromSelection() abort
  let temp = @@
  normal! gvy
  let raw_text = @@
  let @@ = temp
  return raw_text
endfunction

" Returns a search pattern from raw text, whose every character will be treated literally in searches. Searches will also mind case.
function! s:SanitizeRawTextAsLiteralPattern(raw_text) abort
  " Escape the backslash (\) and terminating character (/) so they are treated literally in
  " searches.
  " Prepend \V to treat all other characters literally as well.
  " Prepend \C to mind case.
  let search_pattern = escape(a:raw_text, '\/')
  let search_pattern = '\C\V' . search_pattern

  " Replace some literal characters (new line, carriage return <CR>, and escape <Esc>) with a command-friendly representation.
  let search_pattern = substitute(search_pattern, '\n', '\\n', 'g')
  let search_pattern = substitute(search_pattern, '\r', '\\r', 'g')
  let search_pattern = substitute(search_pattern, '\e', '\\e', 'g')

  return search_pattern
endfunction

" Begins a substitution command that will operate on the entire file. The current visual selection
" at the time of invocation is the text that will be replaced. The cursor is left in a position
" where you can type in the text to be inserted in its place and hit enter. The c flag is included
" in the substitution command to allow you to confirm each substitution.
function! s:ReplaceSelection() abort

  let raw_text = s:GetRawTextFromSelection()
  let search_pattern = s:SanitizeRawTextAsLiteralPattern(raw_text)

  " Type out the substitute command
  call feedkeys(':%s/' . search_pattern . '//gc' . "\<Left>\<Left>\<Left>", 'n')
endfunction
