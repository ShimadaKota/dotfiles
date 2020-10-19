" dein configurations.

let s:dein_dir = expand('~/dotfiles/plugins')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
execute 'set runtimepath+=' . s:dein_repo_dir

" Required:
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:rc_dir    = expand('~/dotfiles')
    let s:toml      = s:rc_dir . '/dein.toml'
    let s:lazy_toml = s:rc_dir . '/deinlazy.toml'
    " Let dein manage dein
    " Required:
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    if dein#tap('deoplete.nvim') && has('nvim')
        call dein#disable('neocomplete.vim')
    endif
    call dein#disable('neobundle.vim')
    call dein#disable('neopairs.vim')

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif
