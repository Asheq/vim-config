" jsbeautify.vim
" :JsBeautify invokes js-beautify on the given range
" Credit: noahfrederick/jsbeautify.vim

" TODO-HIGH: Take specific improvements from noahfrederick/jsbeautify.vim

if !executable('js-beautify')
    finish
endif

augroup jsbeautify
    autocmd!
    autocmd FileType css,html,javascript,json
                \ command! -nargs=0 -range=% -buffer JsBeautify <line1>,<line2>call s:JsBeautify()
augroup END

function! s:JsBeautify() range abort
    " Set current working directory to directory of current file
    cd %:p:h
    " Run js-beautify
    let ft = &filetype
    let cmd = [
                \ '!js-beautify',
                \ '--editorconfig',
                \ '--type',
                \ ft,
                \ ]
    execute a:firstline . ',' . a:lastline . join(cmd)
    " Reset current working directory
    cd -
endfunction
