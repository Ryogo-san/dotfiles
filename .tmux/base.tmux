# 基本設定
## 256色端末を使用する
set -g default-terminal "screen-256color"
set -g terminal-overrides "xterm:colors=256"

## デフォルトシェルをBashにする
## 適宜
set-option -g default-command /bin/bash

## クリップボードへのコピー
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"

