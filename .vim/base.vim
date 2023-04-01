" シンタックスを有効化
syntax on

" ファイルタイプに基づいたインデントを有効化
filetype plugin indent on

" htmlやmarkdown編集でカーソルが前に行くのを防ぐ？
syn sync fromstart

" 自動インデントを有効化
set autoindent

set nowrap
" 文字コードをUTF-8に設定
set fenc=utf-8

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup

" バックアップファイルを作らない
set nobackup

" スワップファイルを作らない
set noswapfile

" 編集中のファイルが変更されたら自動で読み直す
set autoread

"バッファが編集中でもその他のファイルを開けるように
set hidden

" 入力中のコマンドをステータスに表示する
set showcmd

" 検索パターンにマッチするテキストをすべて強調表示する
set hlsearch

" 検索パターンにおいて大文字と小文字を区別しない
set ignorecase


" 検索パターンが大文字を含んでいたらignorecaseを上書きする
set smartcase

" backspaceキー有効化
set backspace=indent,eol,start

" HTMLの補完
" https://qiita.com/Zhirou/items/f533dd40fceff6249049
" 例：
"   <div>の後に</を入力しEnter押すと真ん中に改行＆補完
"   <div>の後に</を入力しTab押すと真ん中に改行なし＆補完
augroup MyHTML
    autocmd!
    autocmd Filetype html inoremap <buffer> </<CR> </<C-x><C-o><ESC>F>a<CR><ESC>O
    autocmd Filetype html inoremap <buffer> </<Tab> </<C-x><C-o><ESC>F>a
augroup END


