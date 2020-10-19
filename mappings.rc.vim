"---------------------------------------------------------------------------
" カーソル下の単語をハイライト
vnoremap <silent> * "zy:let @/ = @z<CR>:set hlsearch<CR>
" 削除
vnoremap <silent> x x:let@x=@"<CR>
vnoremap <silent> d d:let@d=@"<CR>
vnoremap <silent> s "dygvs
" 行移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]

"---------------------------------------------------------------------------
" jjで挿入モード解除
inoremap jj <ESC>
" カーソルを右に移動
inoremap <C-l> <Right>
" カーソルを左に移動
inoremap <C-h> <Left>
" カーソルを上下に移動 / 補完候補選択
inoremap <C-j> <C-Down>
inoremap <C-k> <C-Up>

"---------------------------------------------------------------------------
" 移動
cnoremap <C-a>          <Home>
cnoremap <C-b>          <Left>
cnoremap <C-e>          <End>
cnoremap <C-f>          <Right>
cnoremap <C-n>          <Down>
cnoremap <C-p>          <Up>
cnoremap <C-y>          <C-r>*

"---------------------------------------------------------------------------
"上下に空行を挿入する
nnoremap <C-Up> mzO<ESC>`z
nnoremap <C-Down> mzo<ESC>`z
" ディレクトリ移動
nnoremap cd :cd %:p:h<CR>:pwd<CR>
" 移動
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" タブ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" 保存，終了
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>x :x<CR>
nnoremap <Space>wq :wq<CR>
nnoremap <Space>1 :q!<CR>
" 更新
nnoremap <C-c> :e!<CR>
" xとsでヤンクしない
nnoremap x "_x
nnoremap s "_s
" カーソル下の単語をハイライト
nnoremap <silent> * :let @/="\\<"<CR>"zyiw:let @/.=@z<CR>:let @/.="\\>"<CR>:set hlsearch<CR>
" エスケープ2回でハイライトを消す
nnoremap <Esc><Esc> :noh<CR>
" 削除
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciw "cyiwciw
nnoremap <silent> cw "cywcw
nnoremap <silent> diw "dyiwdiw
nnoremap <silent> dw "dywdw
" ノーマルモードでスペースを使う
nnoremap <Space><Space> i<Space><ESC><Right>
