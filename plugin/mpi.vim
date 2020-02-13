let g:mpi#default = ''
let g:mpi#filetypes = {
    \ 'awk'     : '',
    \ 'clojure' : '',
    \ 'cpp'     : '',
    \ 'css'     : '',
    \ 'diff'    : '',
    \ 'dosini'  : '',
    \ 'dosbatch': '',
    \ 'erlang'  : '',
    \ 'forth'   : '',
    \ 'go'      : '',
    \ 'haskell' : '', 'lhaskell': '', 'chaskell': '',
    \ 'hex'     : '',
    \ 'html'    : '',
    \ 'java'    : '',
    \ 'icon'    : '',
    \ 'json'    : '',
    \ 'less'    : '',
    \ 'lisp'    : '',
    \ 'lua'     : '',
    \ 'markdown': '',
    \ 'mysql'   : '', 'msql'   : '',
    \ 'ocaml'   : 'λ',
    \ 'php'     : '',
    \ 'python'  : '',
    \ 'rmd'     : '',
    \ 'ruby'    : '',
    \ 'rust'    : '',
    \ 'sass'    : '',
    \ 'scss'    : '',
    \ 'scala'   : '',
    \ 'twig'    : '',
    \ 'vim'     : '',
    \ 'vue'     : '﵂',
    \ 'xhtml'   : '',
    \ 'xml'     : '',
    \ 'yml'     : '',
    \ 'zsh'     : '',
    \ 'typescriptreact': '',
    \ 'javascript': '',
    \ 'javascriptreact': '',
\}

let g:mpi#extensions = {
    \ 'bin'     : '',
    \ 'coffee'  : '',
    \ 'conf'    : '',
    \ 'd'       : '',
    \ 'dart'    : '',
    \ 'db'      : '',
    \ 'dump'    : '',
    \ 'dylib'   : '',
    \ 'f#'      : '',
    \ 'fsi'     : '',
    \ 'fsx'     : '',
    \ 'go'      : '',
    \ 'hbs'     : '',
    \ 'ini'     : '',
    \ 'lock'    : '',
    \ 'log'     : '',
    \ 'mustache': '',
    \ 'pl'      : '',
    \ 'plist'   : '况',
    \ 'pm'      : '',
    \ 'pp'      : '',
    \ 'ps1'     : '',
    \ 'rmeta'   : '',
    \ 'rss'     : '',
    \ 'scala'   : '',
    \ 'slim'    : '',
    \ 'sln'     : '',
    \ 'so'      : '',
    \ 'styl'    : '',
    \ 'suo'     : '',
    \ 'swift'   : '',
    \ 't'       : '',
    \ 'toml'    : '',
    \ 'ts'      : '',
    \ 'tsx'     : '',
    \ 'txt'     : '',
    \ 'gz'      : '', 'zip': '',
    \ 'ai'      : '', 'psd': '', 'psb': '',
    \ 'jpg'     : '', 'jpeg': '', 'bmp': '', 'png': '', 'gif': '',
    \ 'fsscript'     : '',
    \ 'timestamp'    : '﨟',
    \ 'xcplayground' : '',
    \ 'awk'     : '',
    \ 'css'     : '',
    \ 'ejs'     : '',
    \ 'sass'    : '',
    \ 'scss'    : '',
    \ 'less'    : '',
    \ 'twig'    : '',
    \ 'vue'     : '﵂',
    \ 'vim'     : '',
    \ 'lua'     : '',
    \ 'jsx'     : '',
    \ 'js'      : '', 'javascript': '', 'es': '', 'mjs': '',
    \ 'bat'     : '', 'sys': '',
    \ 'cpp'     : '', 'c++': '', 'cxx': '', 'cc': '', 'cp': '', 'c': '',
    \ 'cljs'    : '', 'edn': '', 'clj': '', 'cljx': '', 'cljc': '',
    \ 'diff'    : '', 'rej': '',
    \ 'erl'     : '', 'hrl': '', 'yaws': '',
    \ 'ex'      : '', 'exs': '', 'eex': '',
    \ 'fs'      : '', 'ft': '', 'fth': '',
    \ 'h'       : '', 'hpp': '', 'hxx': '',
    \ 'hex'     : '', 'h32': '',
    \ 'ico'     : '', 'icn': '',
    \ 'htm'     : '', 'html': '',
    \ 'xhtml'   : '', 'xht': '',
    \ 'hs'      : '', 'hs-boot': '', 'lhs': '', 'chs': '',
    \ 'java'    : '', 'jav': '',
    \ 'json'    : '', 'jsonp': '',
    \ 'lsp'     : '', 'jl': '', 'lisp': '', 'el': '', 'cl': '', 'L': '',
    \ 'md'      : '', 'markdown': '', 'mdown': '', 'mkd': '', 'mkdn': '', 'mdwn': '',
    \ 'ml'      : 'λ', 'mli': 'λ', 'mll': 'λ', 'mly': 'λ',
    \ 'php'     : '', 'phtml': '', 'ctp': '',
    \ 'py'      : '', 'pyc': '', 'pyo': '', 'pyd': '', 'pyw': '', 'ptl': '', 'pyi': '',
    \ 'rs'      : '', 'rlib': '',
    \ 'sh'      : '', 'bash': '', 'csh': '', 'fish': '', 'ksh': '', 'zsh': '',
    \ 'sql'     : '', 'mysql': '', 'msql': '',
    \ 'rb'      : '', 'rbw': '',
    \ 'rmd'     : '', 'Rmd': '', 'Smd': '', 'smd': '',
    \ 'xml'     : '', 'xul': '',  'wsdl': '', 'wpl': '', 'xmi': '', 'csproj': '', 'csproj.user': '', 'ui': '', 'xlf': '', 'xliff': '',
    \ 'yml'     : '', 'yaml': '',
\}

let g:mpi#exact_matches = {
    \ '.gitignore'      : '',
    \ '.vimrc'          : '',
    \ '.bashrc'         : '',
    \ 'LICENSE'         : '',
\}

function! mpi#get(bufname) abort
    let ext = fnamemodify(expand(a:bufname), ':e')
    if empty(ext)
        let l:has_key = has_key(g:mpi#exact_matches, a:bufname)
        if l:has_key
            return get(g:mpi#exact_matches, a:bufname, g:mpi#default)
        else
            let ft = getbufvar(a:bufname, '&ft')
            if empty(ft)
                return g:mpi#default
            else
                return get(g:mpi#filetypes, ft, g:mpi#default)
            endif
        endif
    else
        return get(g:mpi#extensions, ext, g:mpi#default)
    endif
endfunction
