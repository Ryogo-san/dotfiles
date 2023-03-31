#!/usr/bin/bash

set -ue

function powerline(){
    pip3 install  powerline-status
    pip3 install  powerline-shell
}

powerline
