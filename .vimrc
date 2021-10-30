" シンタックスを有効化
syntax on

" ファイルタイプに基づいたインデントを有効化
filetype plugin indent on

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

" => Plugin系 -------------------------------------------------------------{{{
"
set nocompatible            " be improved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

"------------------------------------------
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Python plugin
"Plugin 'davidhalter/jedi-vim'
" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview 

" dracula
"Plugin 'dracula/vim'

" molokai
Plugin 'tomasr/molokai'

" markdown preview
Plugin 'suan/vim-instant-markdown'

" file icons
"Plugin 'ryanoasis/vim-devicons'

" extra fonts
"Plugin 'ryanoasis/nerd-fonts'
" guifontを設定しないと文字化けする
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
"set encoding=utf-8
" フォルダアイコンを表示
"let g:WebDevIconNerdTreeBeforeGlyphPadding=""
"let g:WebDevIconsUnicodeDecorateFolderNodes=v:true

" file tree viewer
Plugin 'scrooloose/nerdtree'

" mapping
Plugin 'tpope/vim-unimpaired'

" status bar design
"Plugin 'vim-airline/vim-airline'

" status bar theme
"Plugin 'vim-airline/vim-airline-themes'

" 自動補完
"Plugin 'shougo/deoplete.nvim'
""jedi-vimとの併用に必要らしい(併用できなさそうだけど。。。)
"autocmd FileType python setlocal omnifunc=jedi#completions
"let g:jedi#completions_enabled = 0
"let g:jedi#auto_vim_configuration = 0
"if !exists('g:neocomplete#force_omni_input_patterns')
"        let g:neocomplete#force_omni_input_patterns = {}
"endif
""let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"" neo-completeの設定
"let g:neocomplete#enable_at_startup=1
""" ポップアップメニューで表示される候補の数
"let g:neocomplete#max_list=50
""" キーワードの長さ
"let g:neocomplete#max_keyword_width=80
"let g:neocomplete#enable_ignore_case=1
"highlight Pmenu ctermbg=6
"highlight PmenuSel ctermbg=3
"highlight PMenuSbar ctermbg=0
"inoremap <expr><CR> pumvisible()?neocomplete#close_popup():"<CR>"

" vimtex
Plugin 'lervag/vimtex'
"部分的にコンパイルする設定
function! s:previewTex() range
let l:tmp = @@
silent normal gvy
let l:selected = split(@@, "\n")
let @@ = l:tmp

" \"\\documentclass{tADR2e}",
"" let l:template1 = ["\\documentclass[a4paper]{jsarticle}",
" \"\\usepackage[dvipdfmx]{graphicx}",
" \"\\usepackage{amsmath,amssymb,bm}",
" \"\\pagestyle{empty}",
let l:template1 = ["\\documentclass{jsarticle}",
\"\\begin{document}"]
let l:template2 = ["\\end{document}"]

let l:output_file = "preview.tex"
call writefile(extend(extend(l:template1, l:selected), template2), l:output_file)
call system("latexmk preview.tex")
call system("mupdf preview.pdf")
endfunction
autocmd FileType tex
\ | vnoremap <buffer> <localleader>la :call <SID>previewTex()<CR>
" vim-quickrun
Plugin 'thinca/vim-quickrun'

" オートセーブ
Plugin 'vim-scripts/vim-auto-save'
let g:auto_save=1 "オートセーブは常に有効

" undo treeの可視化
Plugin 'sjl/gundo.vim'

" 補完
"Plugin 'neoclide/coc.nvim'

" ソースコード整形
Plugin 'prettier/vim-prettier'

" Language Server
Plugin 'neoclide/coc.nvim'

" All of your Plugins must be added before the following line
call vundle#end()           " required
"------------------------------------------

" nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent='<RightMouse>'
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.*.db,*.sqlite
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"autocmd BufWritePre * :FixWhitespace

"" NERDTreeのウインドウしか開かれていないときは自動的に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

"
filetype plugin indent on   " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help        - lists configurated plugins
" :PluginList       - lists configurated plugins
" :PluginInstall    - installs plugins; apend '!' to update or just: PluginUpdate
" :PluginSearch foo - searches for foo; append '!' to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append '!' to auto-approve removal

" -------------------------------------------------------}}}

" => 見た目系 -----------------------------------------------------------------------{{{

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
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

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

"----------------------------------------------------------------------------------}}}
