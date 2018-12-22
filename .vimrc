set encoding=utf-8   "encoding when loading a file
scriptencoding utf-8 "encoding in this file

set fileencoding=utf-8
set ambiwidth=double

" install dir 
let s:dein_dir = expand('~/.cache/dein') "<- dein によってプラグインがインストールされるディレクトリ ##########
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
" dein installation check
if &runtimepath !~# '/dein.vim'
 if !isdirectory(s:dein_repo_dir)
 execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
 endif
 execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
 
" begin settings
if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)
 
 " .toml file
 let g:rc_dir = expand('~/.vim/dein') "<- dein.toml dein_lazy.toml を読み込むディレクトリ ##########
 let s:toml = g:rc_dir . '/dein.toml'
 let s:lazy_toml = g:rc_dir . '/dein_lazy.toml' "<- dein_lazy.toml を使わない場合はこの行をコメントアウト##########
 
 " read toml and cache
 call dein#load_toml(s:toml, {'lazy': 0})
 call dein#load_toml(s:lazy_toml, {'lazy': 1}) "<- dein_lazy.toml を使わない場合はこの行をコメントアウト ##########
 
 " end settings
 call dein#end()
 call dein#save_state()
endif
 
" plugin installation check
if dein#check_install()
 call dein#install()
endif

"表示・カーソル
syntax on
set number
set cursorline
set t_Co=256
colorscheme molokai
"タブ&インデント
set tabstop=3
set expandtab      "タブ入力を複数の空白文字に置き換える
set softtabstop=3
set autoindent     "改行時に前の行のインデントを継続する
set smartindent    "改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=3   "smartindentで増減する幅

"文字列検索
set incsearch  "インクリメンタルサーチ：１文字入力ごとに検索
set ignorecase "検索パターンに大小文字を区別しない
set smartcase  "検索パターンに大文字を含んでいたら大小文字を区別
set hlsearch   "検索結果をハイライト
"ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

"カッコ・タグジャンプ
source $VIMRUNTIME/macros/matchit.vim "Vimの%を拡張

"コマンド補完
set wildmenu "コマンドモードの補完

if &term == "xterm-256color"
   colorscheme molokai
   hi Comment ctermfg=102
   hi Visual ctermbg=236
endif

"短縮入力設定
ab #b /********************************************************************
ab #e ********************************************************************/

