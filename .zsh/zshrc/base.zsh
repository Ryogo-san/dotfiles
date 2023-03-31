## vimライクな操作を有効にする
## 文字入力中のカーソル移動など
bindkey -v

## プロンプト表示
PROMPT='%F{green}%n@%m%F{white}:%f%f%F{blue}%~%f$ '

## 色を使用できるようにする
#autoload -Uz colors;colors


## ヒストリを保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## [TAB]でパス名の補完候補を表示した後、
## 続けて[TAB]を押すと候補からパス名を選択できるようになる
## 候補を選ぶには[TAB]かctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

## 自動補完を有効にする
autoload -U compinit; compinit

## tmux用
unset TMPDIR
TMUX_TMPDIR=/tmp

# rbenv
[[ -d ~/.rbenv ]] &&
export PATH="$HOME/.rbenv/bin:$PATH" &&
eval "$(rbenv init -)"

## sdkman
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!$
#export SDKMAN_DIR="$HOME/.sdkman"$
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"$
