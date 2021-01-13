function! vimrc#get_statusline()

    let g:show_position = get(g:, 'show_position', 1)

    let scrollbar = ""
    if g:show_position
        let scrollbar = " %2*%{noscrollbar#statusline(30,' ','█',['▐'],['▌'])}%* "
    endif

    return ""
                \ . "%1*%{expand('%:p:~:.')}%* "
                \ . "%h%w%m%r%y%{FugitiveStatusline()}"
                \ . scrollbar
                \ . "[%P]"
                \ . "%="
                \ . "%([%{vimrc#get_window_cwd()}]%)"
endfunction

function! vimrc#get_fold_text()
  return repeat(' ', indent(v:foldstart)) . foldtext()
endfunction

function! vimrc#open_in_shell(item)
    execute 'silent !open ' . shellescape(a:item, 1)
endfunction

function! vimrc#echo_in_shell(item)
    execute '!echo ' . shellescape(a:item, 1)
endfunction

function! vimrc#url_encode(str)
    return substitute(iconv(a:str, 'latin1', 'utf-8'),'[^A-Za-z0-9_.~-]','\="%".printf("%02X",char2nr(submatch(0)))','g')
endfunction

function! vimrc#define(keyword)
    call vimrc#open_in_shell('dict://' . vimrc#url_encode(a:keyword))
endfunction

function! vimrc#search(keyword)
    if match(a:keyword, '^https://') > -1
        call vimrc#open_in_shell(a:keyword)
    else
        call vimrc#open_in_shell('https://duckduckgo.com/' . vimrc#url_encode(a:keyword))
    endif
endfunction

function! vimrc#echo(keyword)
    call vimrc#echo_in_shell('echo://' . vimrc#url_encode(a:keyword))
endfunction

command! -nargs=1 Define call vimrc#define(<f-args>)
command! -nargs=1 Search call vimrc#search(<f-args>)
command! -nargs=1 Echo call vimrc#echo(<f-args>)

function! vimrc#get_selection_text()
    let temp = getreg("v")
    normal! gv"vy
    let raw_text = getreg("v")
    call setreg("v", temp)
    return raw_text
endfunction

function! vimrc#create_toggle_maps(letter, test, off, on)
    execute 'nnoremap [r' . a:letter . ' :' . a:on . '<CR>'
    execute 'nnoremap ]r' . a:letter . ' :' . a:off . '<CR>'
    execute 'nnoremap yr' . a:letter . ' :' . '<C-r>=' . a:test . '?"' . a:off . '":"' . a:on . '"<CR><CR>'
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

function! vimrc#mru_dirvish()
    enew
    silent 0put=v:oldfiles
    silent keeppatterns %s/\v(.*)/\=fnamemodify(submatch(1),':p')/
    keepjumps 0
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    setlocal conceallevel=0
    set ft=dirvish
    nunmap <buffer> /
    nunmap <buffer> ?
endfunction
