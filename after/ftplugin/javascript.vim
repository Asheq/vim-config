setlocal keywordprg=:JavascriptKeywordLookup

command! -nargs=1 JavascriptKeywordLookup call s:javascript_keyword_lookup(<f-args>)

function! s:javascript_keyword_lookup(keyword) abort
    execute 'silent !open ' . shellescape('https://developer.mozilla.org/en-US/search?q=' . a:keyword, 1)
endfunction
