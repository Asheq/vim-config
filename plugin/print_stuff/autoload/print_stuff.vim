function! print_stuff#print_basic_info()
  call s:print_values([
        \ {
        \   'title': 'Basic',
        \   'items': [
        \     {'label': 'Working directory', 'value': getcwd()},
        \     {'label': 'File name', 'value': expand('%:.')},
        \     {'label': 'Git branch', 'value': FugitiveHead()},
        \     {'label': 'filetype', 'value': &filetype, 'secondary': s:last_set('filetype')},
        \   ]
        \ },
        \ {
        \   'title': 'Spacing',
        \   'items': [
        \     {'label': 'expandtab', 'value': &expandtab, 'secondary': s:last_set('expandtab')},
        \     {'label': 'tabstop', 'value': &tabstop, 'secondary': s:last_set('tabstop')},
        \     {'label': 'shiftwidth', 'value': &shiftwidth, 'secondary': s:last_set('shiftwidth')},
        \     {'label': 'textwidth', 'value': &textwidth, 'secondary': s:last_set('textwidth')},
        \   ]
        \ },
        \ {
        \   'title': 'Encoding and format',
        \   'items': [
        \     {'label': 'fileencoding', 'value': &fileencoding, 'secondary': s:last_set('fileencoding')},
        \     {'label': 'fileformat (EOL)', 'value': &fileformat, 'secondary': s:last_set('fileformat')},
        \   ]
        \ }
        \ ])
endfunction

function! print_stuff#print_indenting_and_formatting_options()
  call s:print_values([
        \ {
        \   'title': 'Indenting methods for = operator',
        \   'items': [
        \     {'label': 'equalprg', 'value': &equalprg, 'secondary': s:last_set('equalprg')},
        \     {'label': 'indentexpr', 'value': &indentexpr, 'secondary': s:last_set('indentexpr')},
        \     {'label': 'cindent', 'value': &cindent, 'secondary': s:last_set('cindent')},
        \   ]
        \ },
        \ {
        \   'title': 'For indentexpr',
        \   'items': [
        \     {'label': 'indentkeys', 'value': &indentkeys, 'secondary': s:last_set('indentkeys')},
        \   ]
        \ },
        \ {
        \   'title': 'For cindent',
        \   'items': [
        \     {'label': 'cinkeys', 'value': &cinkeys, 'secondary': s:last_set('cinkeys')},
        \     {'label': 'cinoptions', 'value': &cinoptions, 'secondary': s:last_set('cinoptions')},
        \     {'label': 'cinwords', 'value': &cinwords, 'secondary': s:last_set('cinwords')},
        \   ]
        \ },
        \ {
        \   'title': 'Indenting methods not for = operator',
        \   'items': [
        \     {'label': 'smartindent', 'value': &smartindent, 'secondary': s:last_set('smartindent')},
        \     {'label': 'autoindent', 'value': &autoindent, 'secondary': s:last_set('autoindent')},
        \   ]
        \ },
        \ {
        \   'title': 'Formatting methods for gq/gw operator',
        \   'items': [
        \     {'label': 'formatexpr', 'value': &formatexpr, 'secondary': s:last_set('formatexpr')},
        \     {'label': 'formatprg', 'value': &formatprg, 'secondary': s:last_set('formatprg')},
        \     {'label': '[internal formatting]', 'value': '[N/A]'},
        \   ]
        \ },
        \ {
        \   'title': 'For internal formatting',
        \   'items': [
        \     {'label': 'formatoptions', 'value': &formatoptions, 'secondary': s:last_set('formatoptions')},
        \     {'label': 'formatlistpat', 'value': &formatlistpat, 'secondary': s:last_set('formatlistpat')},
        \     {'label': 'comments', 'value': &comments, 'secondary': s:last_set('comments')},
        \     {'label': 'commentstring', 'value': &commentstring, 'secondary': s:last_set('commentstring')},
        \   ]
        \ }
        \ ])
endfunction

function! s:last_set(option)
  let temp = getreg("l")
  redir @l
  execute 'silent verbose set ' . a:option
  redir END
  let full_value = getreg("l")
  call setreg("l", temp)

  let idx = match(full_value, 'Last set from ')
  if (idx != -1)
    let file = substitute(full_value[idx:], 'Last set from ', '', '')
    let file = substitute(file, '\vline \d+$', '', '')
    return ' => ' . substitute(file, $VIMRUNTIME, '$VIMRUNTIME', 'g')
  else
    return ''
  endif
endfunction

function! s:print_values(categories)
  let all_items = []
  for category in a:categories
    let all_items = all_items + category.items
  endfor
  let max_item_label_length = max(map(all_items, 'len(v:val.label)'))

  for category in a:categories
    call s:echo_hi(category.title, 'Title', 'echo')

    for item in category.items
      echo repeat(' ', max_item_label_length - len(item.label))
      call s:echo_hi(item.label . ': ', 'Statement', 'echon')
      if exists('item.value')
        echon item.value
      endif
      if exists('item.secondary')
        call s:echo_hi(item.secondary, 'NonText', 'echon')
      endif
    endfor
  endfor
endfunction

function! s:echo_hi(msg, hi_grp, echo_cmd)
  execute "echohl " . a:hi_grp
  execute a:echo_cmd . " '" . a:msg . "'"
  echohl None
endfunction
