set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# resurrect
set -g @resurrect-strategy-vim 'session'

# Initialize TMUX plugin manager
run '~/.tmux/plugins/tpm/tpm'

# restore session before rebooting
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @resurrect-strategy-vim 'session'


