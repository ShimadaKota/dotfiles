function! s:source_rc(path, ...) abort "{{{
    let use_global = get(a:000, 0, !has('vim_starting'))
    let abspath = resolve(expand('~/dotfiles/' . a:path))
    if !use_global
        execute 'source' fnameescape(abspath)
        return
    endif

    " substitute all 'set' to 'setglobal'
    let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
    " create tempfile and source the tempfile
    let tempfile = tempname()
    try
        call writefile(content, tempfile)
        execute 'source' fnameescape(tempfile)
    finally
        if filereadable(tempfile)
            call delete(tempfile)
        endif
    endtry
endfunction "}}}

if has('vim_starting')
endif

call s:source_rc('dein.rc.vim')

if !has('vim_starting')
    call dein#call_hook('source')
    call dein#call_hook('post_source')
    syntax enable
    filetype plugin indent on
endif

call s:source_rc('mappings.rc.vim')
call s:source_rc('options.rc.vim')

execute 'set runtimepath+=' . "~/dotfiles/after"

set secure

set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"
