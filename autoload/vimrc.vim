function! vimrc#echo_highlight_info()
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
endfunction

function! vimrc#get_statusline()
    return ""
                \ . "%1*%{expand('%:p:~:.')}%* "
                \ . "%h%w%m%r[%P]"
                \ . "%="
                \ . "%([%{vimrc#get_window_cwd()}]%)"
endfunction

function! vimrc#get_fold_text()
  return repeat(' ', indent(v:foldstart)) . foldtext()
endfunction

function! vimrc#open_in_shell(item, ...)
    let application = get(a:, 1, 0)

    let prefix = 'silent !open '
    if application isnot 0
        let prefix = prefix . '-a "' . application . '" '
    endif

    execute prefix . shellescape(a:item, 1)
endfunction

function! vimrc#url_encode(str)
    return substitute(iconv(a:str, 'latin1', 'utf-8'),'[^A-Za-z0-9_.~-]','\="%".printf("%02X",char2nr(submatch(0)))','g')
endfunction

function! vimrc#define(keyword)
    call vimrc#open_in_shell('dict://' . vimrc#url_encode(a:keyword))
endfunction

function! vimrc#browse(item)
    if match(a:item, '^https\?://') > -1
        " The item is already a URL
        let @* = a:item
        echo 'Copied' a:item
    else
        " The item is a keyword, so let's generate a DuckDuckGo URL
        let url = 'https://duckduckgo.com/?q=' . vimrc#url_encode(a:item)
        let @* = url
        echo 'Copied' url
    endif
endfunction

command! -nargs=1 Define call vimrc#define(<f-args>)
command! -nargs=1 Browse call vimrc#browse(<f-args>)

function! vimrc#get_selection_text()
    let temp = getreg("v")
    normal! gv"vy
    let raw_text = getreg("v")
    call setreg("v", temp)
    return raw_text
endfunction

function! vimrc#main_nvim_flag()
    return v:servername == $NVIM_LISTEN_ADDRESS ? 'Y' : 'N'
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
