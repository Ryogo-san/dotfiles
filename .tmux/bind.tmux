## マウス操作を有効化
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"
bind -n WheelDownPane select-pane -t=\; send-keys -M

## ペインの移動をVim形式にする
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

## 画面分割
bind - split-window -v
unbind '%'
bind | split-window -h
unbind '"'

