#!/usr/bin/sh

NVIM_BEGINNER=~/Projects/neovim
export NVIM_BEGINNER

alias nvb='XDG_DATA_HOME=$NVIM_BEGINNER/share XDG_CONFIG_HOME=$NVIM_BEGINNER nvim' 
export nvb

nvb
