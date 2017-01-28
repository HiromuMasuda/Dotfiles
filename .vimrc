""""""""""""""""""""""""""
"NeoBundle
""""""""""""""""""""""""""
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'szw/vim-tags'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

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

""""""""""""""""""""""""""
"Customize keybind
""""""""""""""""""""""""""
"auto parenthesis
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"esc - to normal mode
map <C-j> <esc>
noremap! <C-j> <esc>

"key movement
noremap <space>h ^
noremap <space>l $
noremap <space>/ *

"insert mode
let &t_SI = "\e]50;CursorShape=1\x7"
let &t_EI = "\e]50;CursorShape=0\x7"

"change inner | ci to c
nnoremap c ci

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

""""""""""""""""""""""""""
"vim-trailing-whitespace
""""""""""""""""""""""""""
if neobundle#tap('vim-trailing-whitespace')
  let g:extra_whitespace_ignored_filetypes = ['unite']
endif
