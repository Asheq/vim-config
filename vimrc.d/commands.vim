" TODO Review
" command! -nargs=0 Highlight for id in synstack(line("."), col(".")) | echo synIDattr(id, "name") | endfor
" command! -nargs=0 Highlight2 echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

" TODO Should be a mapping? Shoud put the right side in the command line?
" command! -nargs=0 Trimws keeppatterns %s/\s\+$//e
