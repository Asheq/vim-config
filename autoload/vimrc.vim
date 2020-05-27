function! vimrc#statusline()
  return ""
    \ . "%<%{vimrc#get_buffer_head()}"
    \ . "%1*%t%* "
    \ . "%h%w%m%r%y"
    \ . "%{FugitiveStatusline()}"
    \ . "%="
    \ . "%([%{vimrc#get_window_cwd()}]%)"
    \ . "[%P]"
endfunction

function! vimrc#get_buffer_head()
  let head = expand('%:p:~:.:h') " :help filename-modifiers
  if head == '.' || head == ''
    let head = ''
  elseif head == '/'
    let head = '/'
  else
    let head = head . '/'
  endif
  return head
endfunction

function! vimrc#change_case(visual)
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

function! vimrc#get_text_from_selection()
  let temp = getreg("v")
  normal! gv"vy
  let raw_text = getreg("v")
  call setreg("v", temp)

  return raw_text
endfunction

function! vimrc#define_word(search_term)
  execute 'silent !open ' . shellescape('dict://' . a:search_term)
  " execute 'silent !open ' . shellescape('https://www.merriam-webster.com/dictionary/' . s:url_encode(a:search_term), 1)
  " execute 'silent !open ' . shellescape('https://www.websters1913.com/words/' . s:url_encode(a:search_term), 1)
endfunction

function! s:url_encode(str)
  " NOTE: This implementation was copied from unimpaired
  return substitute(iconv(a:str, 'latin1', 'utf-8'),'[^A-Za-z0-9_.~-]','\="%".printf("%02X",char2nr(submatch(0)))','g')
endfunction

function! vimrc#create_toggle_maps(letter, test, off, on)
  execute 'nnoremap [o' . a:letter . ' :' . a:on . '<CR>'
  execute 'nnoremap ]o' . a:letter . ' :' . a:off . '<CR>'
  execute 'nnoremap yo' . a:letter . ' :' . '<C-r>=' . a:test . '?"' . a:off . '":"' . a:on . '"<CR><CR>'
endfunction

function! vimrc#get_fold_text()
  return repeat(' ', indent(v:foldstart)) . foldtext()
endfunction

function! vimrc#get_global_cwd()
  return getcwd(-1, -1)
endfunction

function! vimrc#get_tab_cwd(tabnr)
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
