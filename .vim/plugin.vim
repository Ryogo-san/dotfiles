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

" Git
Plugin 'tpope/vim-fugitive'

" vim-airline
if has('nvim')
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
endif

" All of your Plugins must be added before the following line
call vundle#end()           " required

