## アクティブなペインを目立たせる
set -g pane-active-border-style fg=white,bg=cyan

## ステータスバーを設定する
### 左パネルを設定する
set -g status-left-length 40
set -g status-left "#[fg=green]Session: #S #[fg=black]#I #[fg=white]#P"

### 右パネルを設定する
set -g status-right "#[fg=black][%Y-%m-%d(%a) %H:%M]"

### リフレッシュの間隔を設定する（デフォルト 15秒）
set -g status-interval 60

### ウインドウリストの位置を中央寄せにする
set -g status-justify centre

### ヴィジュアルノーティフィケーションを有効にする
setw -g monitor-activity on
set -g visual-activity on

### ステータスバーを上部に表示する
set -g status-position top
