#!/usr/bin/bash

set -ue

function zplug(){
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
}

zplug
