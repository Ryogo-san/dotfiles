# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
#
## zplug
source ~/.zplug/init.zsh 
## theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# コマンドをリンクして、PATHに追加し、プラグインは読み込む
zplug load --verbose > /dev/null

# 補完の強化
zplug zsh-users/zsh-completions

# powerline
#if [ -f /usr/share/powerline/bindings/zsh/powerline.zsh ]; then
#    source /usr/share/powerline/bindings/zsh/powerline.zsh
#fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

