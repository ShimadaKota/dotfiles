"---------------------------------------------------------------------------
" ===== 検索 =====
"
" 大文字と小文字を区別しない
set ignorecase
" 大文字検索時のみ大文字と小文字を区別する
set smartcase
" ハイライト
set hlsearch
" 最後まで検索したら最初に戻る
set wrapscan
"---------------------------------------------------------------------------
" ===== 編集 =====
"
" エンコーディング
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8
" tab -> スペース
set smarttab
" スペースがshiftwidthを超えてもtabに変換しない
set expandtab
" tabのスペース数
set tabstop=4
" インデント時のスペース数
set shiftwidth=4
" 自動インデント
set autoindent smartindent
" モードライン
" set modeline
" モードラインの検索行数を設定
" set modelines
" クリップボードを使う
if (!has('nvim') || $DISPLAY != '') && has('clipboard')
    if has('unnamedplus')
        set clipboard& clipboard+=unnamedplus
    else
        set clipboard& clipboard+=unnamed
    endif
endif
" OSのクリップボードとvimのヤンクを共有する
set clipboard=autoselect,unnamedplus
" 挿入時にバックスペースを有効にする
set backspace=indent,eol,start
" 括弧移動
if v:version >= 800
	packadd! matchit
endif
" 変更時に自動で読み込む
set autoread
" CursorHold 間隔
set updatetime=60
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,]
" タイムアウト
set timeout timeoutlen=200 ttimeoutlen=100
" バックアップを作らない
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.
" ビープ音を無効化
set t_vb=
set novisualbell
" 前回の編集場所のカーソル位置から開く
augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" | endif
augroup END
" ステータス行を常に表示
set laststatus=2
" ターミナル接続を高速化
set ttyfast
" マウス有効化
set mouse=a
"---------------------------------------------------------------------------
" ===== 保存 =====
"
" 履歴保存先
set viminfo+=n$HOME/.vim/.viminfo
" コマンドラインの履歴保存数
set history=100
" undoの保存先
if has('persistent_undo')
    set undodir=$HOME/.vim/.vimundo
	set undofile
endif
" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge
" ヤンクの保存行数
set viminfo='20,\"1000
" プラグイン保存先
" execute 'set runtimepath^=' . fnamemodify(expand('<sfile>'), ':h:h')
"---------------------------------------------------------------------------
" ===== 外観 =====
"
" 行番号表示
set number
" タイトルを表示
set title
" 背景色をターミナルと揃える
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
" シンタックスハイライトを有効にする
syntax on
" カラースキーム
colorscheme molokai
" カラースキームを反映
set t_Co=256
" カーソル行の背景色を変える
augroup vimrc-auto-cursorline
    autocmd!
    autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
    autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
    autocmd WinEnter * call s:auto_cursorline('WinEnter')
    autocmd WinLeave * call s:auto_cursorline('WinLeave')

    let s:cursorline_lock = 0
    function! s:auto_cursorline(event)
        if a:event ==# 'WinEnter'
            setlocal nocursorline
            let s:cursorline_lock = 2
        elseif a:event ==# 'WinLeave'
            setlocal nocursorline
        elseif a:event ==# 'CursorMoved'
            if s:cursorline_lock
                if 1 < s:cursorline_lock
                    let s:cursorline_lock = 1
                else
                    setlocal nocursorline
                    let s:cursorline_lock = 0
                endif
            endif
        elseif a:event ==# 'CursorHold'
            setlocal cursorline
            let s:cursorline_lock = 1
        endif
    endfunction
augroup END
" カーソル行の背景色
highlight CursorLine term=underline ctermbg=237 guibg=#293739
" カーソル行番号の色
highlight CursorLineNr ctermbg=blue ctermfg=white
" 行番号の色
highlight LineNr ctermfg=110
" 矩形選択時の色
highlight Visual ctermbg=31
" ハイライトの色
highlight Search ctermbg=219
" カーソル位置をウィンドウ端からn行残してスクロール
set scrolloff=3
" 行を省略せず表示
set display=lastline
" 対応する括弧の強調表示
highlight MatchParen term=standout ctermbg=14 ctermfg=Black guibg=yellow guifg=yellow
" 全角スペースを可視化する
function! ZenkakuSpace() "{{{
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif
" gitgutter
if ! dein#check_install(['vim-gitgutter'])
    "Base
    highlight SignColumn ctermbg = none
    highlight GitGutterAdd ctermfg = green ctermbg = none
    highlight GitGutterChange ctermfg = grey ctermbg = none
    highlight GitGutterDelete ctermfg = red ctermbg = none
    highlight GitGutterChangeDelete ctermfg = red ctermbg = none
    " highlight SignColumn ctermbg = none
    " highlight GitGutterAdd ctermfg = white ctermbg = none
    " highlight GitGutterChange ctermfg = white ctermbg = none
    " highlight GitGutterDelete ctermfg = white ctermbg = none
    " highlight GitGutterChangeDelete ctermfg = white ctermbg = none
    "Line
    highlight GitGutterAddLine ctermfg = white ctermbg = 5
    highlight GitGutterChangeLine ctermfg = white ctermbg = 35
    highlight GitGutterDeleteLine ctermfg = white ctermbg = 33
    highlight GitGutterChangeDeleteLine ctermfg = white ctermbg = 63
endif
"---------------------------------------------------------------------------
"
" ===== 補完 =====
" tabでファイル名補完，リスト表示
set wildmode=longest,list
" 大文字と小文字を区別
set wildignorecase
" 補完時のプレビューの挙動
set completeopt=menu,preview,longest
" タグ補完を消す
set complete-=t
