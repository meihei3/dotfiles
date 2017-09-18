"ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
set nobackup
"vimの短形選択でも自我なきても右へすすめる
set virtualedit=block
"挿入モードでもバックスペースで削除できるようにする
set backspace=indent,eol,start
"全角専用の設定
set ambiwidth=double
"wikdmenueオプションを有効（vinmバーからファイルを選択できる）
set wildmenu

"---------------------------------------------------
" 検索
"---------------------------------------------------
"検索するときに大文字と小文字を区別しない
set ignorecase
"小文字で検索すると大文字と小文字を無視して検索
set smartcase
"検索がファイルの末尾まで進んだらファイルを再び検索
set wrapscan
"インクリメンタル検索（検索ワードの最初の文字を入力した時点で検索が開始）
set incsearch
"検索結果をハイライト表示
set hlsearch

"---------------------------------------------------
" 表示設定
"---------------------------------------------------
"エラーメッセージを表示時にビープを鳴らさない
set noerrorbells
"Windowsでパスの区切りをスラッシュで行う
set shellslash
"インデントの方法の変更
set cinoptions+=:0
"対応するカッコやブレースを表示
set showmatch matchtime=1
"メッセージ表示欄を２行確保
set cmdheight=2
"ステータス行を常に表示
set laststatus=2
"ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
"省略されずに表示
set display=lastline
"タブ文字をCTR-Iで表示し、行末に＄で表示する
set list
"行末のスペースを可視化
set listchars=tab:^\ ,trail:~
"コマンドラインの履歴を10000県保存する
set history=10000
"コメントの色を水色に
hi Comment ctermfg=3
"入力モードでTABキー押下時に半角スペースを挿入
set expandtab
"インデント幅
set shiftwidth=2
"タブキーを押した時に挿入される文字幅を指定
set softtabstop=2
"ファイル内にあるタブ文字の表示幅
set tabstop=2
"ツールバーを非表示にする
set guioptions-=T
"右スクロールバーを非表示
set guioptions+=R
"yでコピーした時にクリップボードに入れる
set guioptions+=a
"メニューバーを非表示にする
set guioptions-=m
"対応する括弧を強調表示
set showmatch
"改行時に入力された末尾に合わせて次の行のインデントを増減する
set smartindent
"スワップファイルを作らない
set noswapfile
"検索にマッチ下行以外を折りたたむ（フォールドする）機能
set nofoldenable
"タイトルを表示
set title
"行番号の表示
set number
"ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
"Escの２回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
"シンタックスハイライト
syntax on
"すべての数を１０進数として扱う
set nrformats=
"行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
"バッファスクロール
set mouse=a
"括弧の補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

"auto read .vimrc
augroup souce-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

"HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 charactors
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
