" BOOKMARK

function! vimrc#statusline()
  return ""
    \ . "%<%{vimrc#get_buffer_head()}"
    \ . "%1*%t%* "
    \ . "%h%w%m%r%y"
    \ . "%="
    \ . "%([%{vimrc#get_window_cwd()}]%)"
    \ . "[%P]"
endfunction

" Choose case for plugged/vim-caser {{{
function! vimrc#choose_case(visual)
  let l:options = [
        \ "&MixedCase",
        \ "&camelCase",
        \ "snake&_case",
        \ "&UPPER_CASE",
        \ "&Title Case",
        \ "&Sentence case",
        \ "space& case",
        \ "kebab&-case",
        \ "dot&.case"]
  let l:choice = confirm("Change case?", join(l:options, "\n"))
  let l:operation = [
        \ "MixedCase",
        \ "CamelCase",
        \ "SnakeCase",
        \ "UpperCase",
        \ "TitleCase",
        \ "SentenceCase",
        \ "SpaceCase",
        \ "KebabCase",
        \ "DotCase"][l:choice - 1]
  if a:visual
    return "\<Plug>CaserV".l:operation
  else
    return "\<Plug>Caser".l:operation
  end
endfunction
" }}}

" Get visual selection raw text {{{
function! vimrc#raw_text_from_selection()
  let temp = @@
  silent normal! gvy
  let raw_text = @@
  let @@ = temp
  return raw_text
endfunction
" }}}

" Define {{{
function! s:url_encode(str) abort
  " NOTE This implementation was copied from unimpaired
  return substitute(iconv(a:str, 'latin1', 'utf-8'),'[^A-Za-z0-9_.~-]','\="%".printf("%02X",char2nr(submatch(0)))','g')
endfunction

function! vimrc#define_word(search_term) abort
  if !exists(':OpenBrowser')
    throw 'Need open-browser plugin to be installed'
  endif
  execute "!open 'dict://" . a:search_term . "'"
  execute 'OpenBrowser https://www.merriam-webster.com/dictionary/' . s:url_encode(a:search_term)
  execute 'OpenBrowser https://www.websters1913.com/words/' . s:url_encode(a:search_term)
endfunction
" }}}

" Create toggle map {{{
function! vimrc#yo(letter, test, off, on)
  execute 'nnoremap [o' . a:letter . ' :' . a:on . '<CR>'
  execute 'nnoremap ]o' . a:letter . ' :' . a:off . '<CR>'
  execute 'nnoremap yo' . a:letter . ' :' . '<C-r>=' . a:test . '?"' . a:off . '":"' . a:on . '"<CR><CR>'
endfunction
" }}}

" Get fold text {{{
function! vimrc#get_fold_text()
  return repeat(' ',indent(v:foldstart)) . foldtext()
endfunction
" }}}

" Get git branch flag {{{
function! vimrc#wrap_if_nonempty(prefix, item, suffix)
  if !empty(a:item)
    return a:prefix . a:item . a:suffix
  endif
  return a:item
endfunction
" }}}

" Get buffer tail and head {{{
function! vimrc#get_buffer_icon()
  return mpi#for(expand('%'))
endfunction

function! vimrc#buffer_name_shown()
  return (vimrc#get_buffer_head() . vimrc#get_buffer_tail()) != ''
endfunction

function! vimrc#get_buffer_head()
  " % = Current file name, as opened
  " ~ = If file is below $HOME, display file name relative to ~ (otherwise leave unmodified)
  " . = If file is below cwd, display file name relative to cwd (otherwise leave unmodified)
  " h = Display file name with last component and separators removed
  let head = expand('%:~:.:h')
  if head == '.' || head == ''
    let head = ''
  elseif head == '/'
    let head = '/'
  else
    let head = head . '/'
  endif
  return head
endfunction
" }}}

" Relative to home {{{
function! vimrc#get_dir_relative_to_home(dirname)
  let dirname = fnamemodify(a:dirname, ':~')
  if dirname == '~/'
    let dirname = '~'
  endif
  return dirname
endfunction
" }}}

" Get cwd {{{
function! vimrc#get_effective_cwd()
  return getcwd()
endfunction

function! vimrc#get_global_cwd()
  return getcwd(-1, -1)
endfunction

function! vimrc#get_tab_cwd(tabnr) abort
  if haslocaldir(-1, a:tabnr)
    return getcwd(-1, a:tabnr)
  endif
  return ''
endfunction

function! vimrc#get_window_cwd()
  if haslocaldir(0)
    return getcwd()
  endif
  return ''
endfunction

function! vimrc#get_directory_tail(dir)
  if (a:dir == '')
    return ''
  elseif (a:dir == '/')
    return '/'
  elseif (a:dir == $HOME)
    return '~'
  else
    return fnamemodify(a:dir, ':t')
  endif
endfunction

function! vimrc#get_directory_head(dir)
  if (a:dir == '' || a:dir == $HOME)
    return ''
  endif

  let head = ''
  if a:dir == '/'
    let head = ''
  else
    let head = fnamemodify(a:dir, ':h')
    let head = vimrc#get_dir_relative_to_home(head)
    if head == '/'
      let head = '/'
    else
      let head = head . '/'
    endif
  endif
  return head
endfunction

" TODO: Consolidate into one parametrized function, e.g. get_cwd('tail', 'global')
function! vimrc#get_global_cwd_tail()
  return vimrc#get_directory_tail(vimrc#get_global_cwd())
endfunction

function! vimrc#get_global_cwd_head()
  return vimrc#get_directory_head(vimrc#get_global_cwd())
endfunction

function! vimrc#get_window_cwd_tail()
  return vimrc#get_directory_tail(vimrc#get_window_cwd())
endfunction

function! vimrc#get_window_cwd_head()
  return vimrc#get_directory_head(vimrc#get_window_cwd())
endfunction

function! vimrc#get_tab_cwd_tail(tabnr)
  return vimrc#get_directory_tail(vimrc#get_tab_cwd(a:tabnr))
endfunction

function! vimrc#get_tab_cwd_head(tabnr)
  return vimrc#get_directory_head(vimrc#get_tab_cwd(a:tabnr))
endfunction

function! vimrc#get_effective_cwd_tail()
  return vimrc#get_directory_tail(vimrc#get_effective_cwd())
endfunction

function! vimrc#get_effective_cwd_head()
  return vimrc#get_directory_head(vimrc#get_effective_cwd())
endfunction
" }}}

" Echo with color {{{
function! s:echo_with_color(message, highlight_group, ...) abort
  let echo_command = a:0 ? "echon" : "echo"
  execute "echohl " . a:highlight_group
  execute echo_command . " '" . a:message . "'"
  echohl Normal
endfunction
" }}}

" Print values {{{
function! vimrc#print_values(categories) abort
  let all_items = []
  for category in a:categories
    let all_items = all_items + category.items
  endfor
  let max_item_label_length = max(map(all_items, 'len(v:val.label)'))

  for category in a:categories
    call s:echo_with_color(category.title, 'Title')
    for item in category.items
      let label_padding_left = max_item_label_length - len(item.label)
      call s:echo_with_color(repeat(' ', label_padding_left) . item.label . ': ', 'Statement')
      if exists('item.value')
        call s:echo_with_color(item.value, 'Normal', 1)
      endif
      if exists('item.secondary')
        call s:echo_with_color(item.secondary, 'NonText', 1)
      endif
    endfor
  endfor
endfunction
" }}}

" Print other options {{{
function! vimrc#get_option_last_set_by(option)
  let temp = @v
  redir @v
  execute 'silent verbose set ' . a:option
  redir END
  let full_value = @v
  let @v = temp
  let idx = match(full_value, 'Last set from .*')
  if (idx != -1)
    let file = substitute(full_value[idx:], 'Last set from ', '', '')
    return ' => ' . substitute(file, $VIMRUNTIME, '$VIMRUNTIME', 'g')
  else
    return ''
  endif
endfunction
" }}}

" Print buffer info {{{
function! vimrc#print_buffer_info() abort
  call vimrc#print_values([
        \ {
        \   'title': 'Basic',
        \   'items': [
        \     {'label': 'Working directory', 'value': vimrc#get_effective_cwd_head() . vimrc#get_effective_cwd_tail()},
        \     {'label': 'File name', 'value': vimrc#get_buffer_head() . vimrc#get_buffer_tail()},
        \     {'label': 'Git branch', 'value': FugitiveHead()},
        \     {'label': 'filetype', 'value': &filetype, 'secondary': vimrc#get_option_last_set_by('filetype')},
        \   ]
        \ },
        \ {
        \   'title': 'Spacing',
        \   'items': [
        \     {'label': 'expandtab', 'value': &expandtab, 'secondary': vimrc#get_option_last_set_by('expandtab')},
        \     {'label': 'tabstop', 'value': &tabstop, 'secondary': vimrc#get_option_last_set_by('tabstop')},
        \     {'label': 'shiftwidth', 'value': &shiftwidth, 'secondary': vimrc#get_option_last_set_by('shiftwidth')},
        \     {'label': 'textwidth', 'value': &textwidth, 'secondary': vimrc#get_option_last_set_by('textwidth')},
        \   ]
        \ },
        \ {
        \   'title': 'Encoding and format',
        \   'items': [
        \     {'label': 'fileencoding (character)', 'value': &fileencoding, 'secondary': vimrc#get_option_last_set_by('fileencoding')},
        \     {'label': 'fileformat (end of line)', 'value': &fileformat, 'secondary': vimrc#get_option_last_set_by('fileformat')},
        \   ]
        \ }
        \ ])
endfunction
" }}}

" Print other options {{{
function! vimrc#print_other_options() abort
  call vimrc#print_values([
        \ {
        \   'title': 'Indenting methods used for = operator',
        \   'items': [
        \     {'label': 'equalprg', 'value': &equalprg, 'secondary': vimrc#get_option_last_set_by('equalprg')},
        \     {'label': 'indentexpr', 'value': &indentexpr, 'secondary': vimrc#get_option_last_set_by('indentexpr')},
        \     {'label': 'cindent', 'value': &cindent, 'secondary': vimrc#get_option_last_set_by('cindent')},
        \   ]
        \ },
        \ {
        \   'title': 'Extra options for indentexpr',
        \   'items': [
        \     {'label': 'indentkeys', 'value': &indentkeys, 'secondary': vimrc#get_option_last_set_by('indentkeys')},
        \   ]
        \ },
        \ {
        \   'title': 'Extra options for cindent',
        \   'items': [
        \     {'label': 'cinkeys', 'value': &cinkeys, 'secondary': vimrc#get_option_last_set_by('cinkeys')},
        \     {'label': 'cinoptions', 'value': &cinoptions, 'secondary': vimrc#get_option_last_set_by('cinoptions')},
        \     {'label': 'cinwords', 'value': &cinwords, 'secondary': vimrc#get_option_last_set_by('cinwords')},
        \   ]
        \ },
        \ {
        \   'title': 'Indenting methods not used for = operator',
        \   'items': [
        \     {'label': 'smartindent', 'value': &smartindent, 'secondary': vimrc#get_option_last_set_by('smartindent')},
        \     {'label': 'autoindent', 'value': &autoindent, 'secondary': vimrc#get_option_last_set_by('autoindent')},
        \   ]
        \ },
        \ {
        \   'title': 'Formatting methods used for gq/gw operator',
        \   'items': [
        \     {'label': 'formatexpr', 'value': &formatexpr, 'secondary': vimrc#get_option_last_set_by('formatexpr')},
        \     {'label': 'formatprg', 'value': &formatprg, 'secondary': vimrc#get_option_last_set_by('formatprg')},
        \     {'label': 'internal formatting', 'value': '[N/A]'},
        \   ]
        \ },
        \ {
        \   'title': 'Extra options for internal formatting',
        \   'items': [
        \     {'label': 'formatoptions', 'value': &formatoptions, 'secondary': vimrc#get_option_last_set_by('formatoptions')},
        \     {'label': 'formatlistpat', 'value': &formatlistpat, 'secondary': vimrc#get_option_last_set_by('formatlistpat')},
        \     {'label': 'comments', 'value': &comments, 'secondary': vimrc#get_option_last_set_by('comments')},
        \     {'label': 'commentstring', 'value': &commentstring, 'secondary': vimrc#get_option_last_set_by('commentstring')},
        \   ]
        \ }
        \ ])
endfunction
" }}}

" vim: fdm=marker
