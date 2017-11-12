" jsbeautify.vim
" TODO: Add way to allow user to add more flags to command dynamically and with a variable (use
" completions!)
" :JsBeautify invokes js-beautify on the given range
" Credit: noahfrederick/jsbeautify.vim

if !executable('js-beautify')
  echo 'To use the :JsBeautify command you need to install the command-line version of js-beautify. Do "npm -g install js-beautify".'
  finish
endif

augroup jsbeautify
  autocmd!
  autocmd FileType css,html,javascript,json call s:CreateCommandAndOperator()
augroup END

function s:CreateCommandAndOperator()
  command! -nargs=0 -range=% -buffer JsBeautify <line1>,<line2>call s:JsBeautify()
" TODO: Add an operator
endfunction

function! s:JsBeautify() range abort
  " Set Vim's current working directory to directory of current buffer so that --editorconfig flag works
  cd %:p:h

  " Run js-beautify
  if &filetype ==# 'javascript' || &filetype ==# 'json'
    let type = 'js'
  else
    let type = &filetype
  endif
  let cmd = [
        \ '!js-beautify',
        \ '--editorconfig',
        \ '--type',
        \ type,
        \ ]
  execute a:firstline . ',' . a:lastline . join(cmd)

  " Reset current working directory
  cd -
endfunction
