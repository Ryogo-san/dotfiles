## 日本語ファイル名を表示可能にする
setopt print_eight_bit

## ビープ音の停止
setopt no_beep
setopt nolistbeep

## 同時に起動したzshの間でヒストリを共有する
setopt share_history

## 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

## ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

## cdした先のディレクトリをディレクトリスタックに追加する
## cd [TAB]でディレクトリのヒストリが表示されるので、選択して移動できる
setopt auto_pushd

## pushdしたとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

