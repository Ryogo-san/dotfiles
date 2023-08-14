#==============================================================#
#               .zshrc                                         #
#==============================================================#

# profile
if [ "$ZSHRC_PROFILE" != "" ]; then
    zmodload zsh/zprof && zprof > /dev/null
fi

source "$ZSHRCDIR/alias.zsh"
source "$ZSHRCDIR/base.zsh"
source "$ZSHRCDIR/plugin.zsh"
source "$ZSHRCDIR/option.zsh"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ryogo/.sdkman$"
[[ -s "/home/ryogo/.sdkman$/bin/sdkman-init.sh" ]] && source "/home/ryogo/.sdkman$/bin/sdkman-init.sh"
