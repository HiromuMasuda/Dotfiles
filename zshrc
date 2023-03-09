# oh-my-zsh installation path
export ZSH=~/.oh-my-zsh

# color theme
ZSH_THEME="avit"

# PATH
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"

# golang
#export PATH="$GOROOT/bin:$PATH"
#export PATH="$PATH:$GOPATH/bin"

# Firebase
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/Projects/private_key/ecpower-production.json

# Google Cloud SDK
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

