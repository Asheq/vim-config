" visual-search.vim
" Use * or # to initiate a search using the visually-selected text.
" The selected text is treated literally (not as a regular expression).
" Credit: godlygeek/vim-files/plugin/vsearch.vim

xnoremap * :<C-u>call VSetSearch()<CR>/<CR>
xnoremap # :<C-u>call VSetSearch()<CR>?<CR>

function! s:GetRawTextFromSelection()
  let temp = @@
  normal! gvy
  let raw_text = @@
  let @@ = temp
  return raw_text
endfunction

function! VSetSearch()

  let search_pattern = s:GetRawTextFromSelection()

  " Escape the escape character (\) so it is treated literally in searches. Prepend \V to treat
  " all other characters literally as well. Prepend \c to ignore case. Ignoring case is the default
  " behaviour of normal-mode * and #.
  let search_pattern = escape(search_pattern, '\')
  let search_pattern = '\c\V' . search_pattern

  " Some characters need to be represented by a friendly alias
  let search_pattern = substitute(search_pattern, '\n', '\\n', 'g')

  let @/ = search_pattern

  " The substitute function below replaces possible search terminating characters (? or /) with a
  " different representation so that invoking a search from the history menu doesn't treat them as
  " terminating characters
  " ? is replaced with \d%63
  " / is replaced with \d%47
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))

endfunction
