" visual-search.vim
" Use * or # to initiate a search using the visually-selected text.
" The selected text, of course, is treated literally (not as a regular expression).
" Inspired By: godlygeek/vim-files/plugin/vsearch.vim

" Recommended mapping
" xnoremap * :<C-u>call VSetSearch()<CR>/<CR>
" xnoremap # :<C-u>call VSetSearch()<CR>?<CR>

function! VSetSearch() abort
  let raw_text = s:GetRawTextFromSelection()
  let search_pattern = s:SanitizeRawTextAsLiteralPattern(raw_text)

  " Set search register with pattern
  let @/ = search_pattern

  " The substitute function below replaces possible search terminating characters (? or /) with a
  " friendly representation so that invoking a search from the search history window doesn't treat
  " them as terminating characters
  " ? is replaced with \d%63
  " / is replaced with \d%47
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))

endfunction

" Returns raw text from current visual selection without clobbering any registers
function! s:GetRawTextFromSelection() abort
  let temp = @@
  normal! gvy
  let raw_text = @@
  let @@ = temp

  return raw_text
endfunction

" Returns a safe search pattern from raw text, whose every character will be treated literally in
" searches (not as a regex). Searches will also ignore case.
function! s:SanitizeRawTextAsLiteralPattern(raw_text) abort
  " Escape the backslash (\) so it is treated literally in searches.
  " Prepend \V to treat all other characters literally as well.
  " Prepend \c to ignore case. Ignoring case is the default behaviour of normal-mode * and #.
  let search_pattern = escape(a:raw_text, '\')
  let search_pattern = '\V\c' . search_pattern

  " Replace literal new line characters in the pattern with a search-friendly alias (\n)
  let search_pattern = substitute(search_pattern, '\n', '\\n', 'g')

  return search_pattern
endfunction
