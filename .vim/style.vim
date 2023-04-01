" 行番号を表示
set number

" 256色
set t_Co=256

" 背景色をcolorschemeに合わせず、terminalと同じにする
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme molokai

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

" 括弧入力時の対応する括弧を表示
set showmatch

" ステータスラインを常に表示
set laststatus=2

" Powerline
if !has('nvim')
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

" コマンドラインの補完
set wildmode=list:longest

" シンタックスハイライトの有効化
syntax enable

" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

" tabを半角スペース4個に変換
set shiftwidth=4    " 自動インデントに使われるスペースの数
set softtabstop=4   " 
set expandtab       " タブをスペースに変換
set tabstop=4       " タブをスペース4文字とカウント
set smarttab

" ルーラー（行、列、現在位置を右下に表示）
set ruler
set list

" 自動折返し
set linebreak

" 長い行をきれいに表示する
set display+=lastline

" コードを折りたたむ(markerを使用)
set foldmethod=marker

set  clipboard=unnamed

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-reference)

augroup HTMLANDXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
