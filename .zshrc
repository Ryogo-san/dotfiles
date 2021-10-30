# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

## vimライクな操作を有効にする
## 文字入力中のカーソル移動など
bindkey -v

## プロンプト表示
#PROMPT='%F{green}%n@%m%F{white}:%f%f%F{blue}%~%f$ '

## 色を使用できるようにする
#autoload -Uz colors;colors

## lsの色つけ
### no：デフォルト
### fi：ファイル
### di：ディレクトリ
### ln：シンボリックファイル
### ex：実行可能ファイル
export LS_COLORS="no=32:fi=97:di=36:ln=97:ex=32:ow=93:*.png=35:*.jpg=35:*.jpeg=35:*.zip=31:*.tgz=31:*.gz=31"
alias ls="ls --color"
alias ll="ls -lG"
alias la="ls -laG"

## lsの色と一致させる
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## 日本語ファイル名を表示可能にする
setopt print_eight_bit

## ビープ音の停止
setopt no_beep
setopt nolistbeep

## ヒストリを保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

## 同時に起動したzshの間でヒストリを共有する
setopt share_history

## 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

## ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

## [TAB]でパス名の補完候補を表示した後、
## 続けて[TAB]を押すと候補からパス名を選択できるようになる
## 候補を選ぶには[TAB]かctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

## 自動補完を有効にする
autoload -U compinit; compinit

## cdした先のディレクトリをディレクトリスタックに追加する
## cd [TAB]でディレクトリのヒストリが表示されるので、選択して移動できる
setopt auto_pushd

## pushdしたとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

## tmux用
unset TMPDIR
TMUX_TMPDIR=/tmp

## zplug
source ~/.zplug/init.zsh

## theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# コマンドをリンクして、PATHに追加し、プラグインは読み込む
zplug load --verbose

# 補完の強化
zplug zsh-users/zsh-completions

# alias
alias ...='cd ../..'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
