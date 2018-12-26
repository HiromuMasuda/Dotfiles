# oh-my-zsh installation path
export ZSH=~/.oh-my-zsh

# color theme
ZSH_THEME="avit"

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Golang
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
