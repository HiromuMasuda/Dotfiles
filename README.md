# dotfiles

## setup

-[]TODO:Ansibleで環境構築を自動化する

### initial setup
1. `brew install git`
2. `git clone https://github.com/HiromuMasuda/dotfiles.git`
3. `ln -sf ~/dotfiles/.vimrc ~/.vimrc` etc..

### .vimrc
1. `brew install vim`
2. [install dein](https://github.com/Shougo/dein.vim#unixlinux-or-mac-os-x)
3. `:call dein#update()`

### tmux
1. `brew install tmux`
2. `brew install reattach-to-user-namespace`


## .vimrc
### dein
- [Shougo/dein.vim - ReadMe](https://github.com/Shougo/dein.vim)
- [Shougo/dein.vim - Command](https://github.com/Shougo/dein.vim/blob/master/doc/dein.txt)

```
:call dein#install()
:call dein#update()
```
