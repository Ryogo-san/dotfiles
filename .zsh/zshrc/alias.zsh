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

alias ...='cd ../..'

# wezterm
alias wezterm="flatpak run org.wezfurlong.wezterm"
