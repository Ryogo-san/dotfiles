#==============================================================#
#               .zshrc                                         #
#==============================================================#

# profile
if [ "$ZSHRC_PROFILE" != "" ]; then
    zmodload zsh/zprof && zprof > /dev/null
fi

source "$ZSHRCDIR/alias.zsh"
source "$ZSHRCDIR/base.zsh"
source "$ZSHRCDIR/option.zsh"

