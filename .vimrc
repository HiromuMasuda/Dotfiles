""""""""""""""""""""""""""
"dein
""""""""""""""""""""""""""
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Plugins
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('rking/ag.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('szw/vim-tags')
  call dein#add('itchyny/lightline.vim')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('airblade/vim-gitgutter')

  " Plugins which is not used
  "call dein#add('tpope/vim-rails')
  "call dein#add('tpope/vim-endwise')
  "call dein#add('slim-template/vim-slim')
  "call dein#add('pangloss/vim-javascript')
  "call dein#add('mxw/vim-jsx')
  "call dein#add('hail2u/vim-css3-syntax')
  "call dein#add('kchmck/vim-coffee-script')
  "call dein#add('cakebaker/scss-syntax.vim')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

""""""""""""""""""""""""""
"Basic setting
""""""""""""""""""""""""""
syntax enable
set number
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noswapfile
set clipboard=unnamed,autoselect
set incsearch
set wildmenu
set showcmd
set smartcase
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set vb t_vb=
set encoding=utf-8

""""""""""""""""""""""""""
"Customize keybind
""""""""""""""""""""""""""

"map leader
let mapleader = "\<Space>"

"auto parenthesis
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"esc - to normal mode
map <C-j> <esc>
noremap! <C-j> <esc>

"key movement
noremap <Leader>/ *

"insert mode
" let &t_SI = "\e]50;CursorShape=1\x7"
" let &t_EI = "\e]50;CursorShape=0\x7"

"window
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>

"refresh buffer
nnoremap <Leader>br :bufdo e!<CR>

""""""""""""""""""""""""""
"Unite.vim
""""""""""""""""""""""""""
let g:unite_enable_start_insert=1

noremap <C-P> :Unite buffer<CR>
noremap <C-Z> :Unite -buffer-name=file file<CR>
noremap <C-N> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""""""
"NERDTree
""""""""""""""""""""""""""
nnoremap <silent><C-e> :NERDTreeToggle<CR>

""""""""""""""""""""""""""
"vim-hybrid / color theme
""""""""""""""""""""""""""
colorscheme hybrid

""""""""""""""""""""""""""
"vim-indent-guides
""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

""""""""""""""""""""""""""
"tab setting | http://qiita.com/wadako111/items/755e753677dd72d8036d
""""""""""""""""""""""""""
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

" Tab jump / t1,t2,t3...
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc : new tab
" tx : close tab
" tn : next tab
" tp : previous tab
map <silent> [Tag]c :tablast <bar> tabnew<CR>
map <silent> [Tag]x :tabclose<CR>
map <silent> [Tag]n :tabnext<CR>
map <silent> [Tag]b :tabprevious<CR>

""""""""""""""""""""""""""
"Ctags
""""""""""""""""""""""""""
set tags=../tags

""""""""""""""""""""""""""
"lightline.vim
""""""""""""""""""""""""""
set laststatus=2
