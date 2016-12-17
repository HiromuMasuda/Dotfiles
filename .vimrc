if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

syntax on
syntax enable
filetype off

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'slim-template/vim-slim'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'Shougo/neomru.vim'
" NeoBundle 'Yggdroot/indentLine'

call neobundle#end()
NeoBundleCheck

set clipboard=unnamed,autoselect
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cursorline
set number
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noswapfile
let g:Powerline_symbols = 'fancy'
set t_Co=256
let g:Powerline_symbols = 'compatible'
set mouse=a
set noshowmode
set guifont=Ricty\ Discord:h12
set guifontwide=Ricty\ Discord:h12
set tabstop=2
"set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set nowrap
set smartindent
filetype plugin indent on
let g:netrw_liststyle = 3
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
let g:netrw_altv = 1
let g:netrw_alto = 1
let g:Powerline_colorscheme='my'
let complcache_enable_at_startup = 1
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3
autocmd VimEnter * VimFiler -split -simple -winwidth=40 -no-quit
autocmd BufRead,BufNewFile * VimFiler -split -simple -winwidth=40 -no-quit

""""""""""""""""""""""Maping""""""""""""""""""""""
map <C-l> gt
map <C-h> gT
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
noremap <C-a> ^
noremap <silent> <C-p> "0p<CR>
noremap mc :'s,'ey<CR>
noremap md :'s,'ed<CR>
noremap wq :r! good bye!<CR>,wq<CR>
noremap <C-t> :tabnew_cdl<CR>
noremap <C-n> :let g:vimfiler_edit_action = 'open'<CR>
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

"""""""""""""""""""""""autocmd"""""""""""""""""""""
"autocmd QuickFixCmdPost * nested cwindow | redraw! 
"autocmd BufNewFile,BufRead *.slim set ft=slim

""""""""""""""""""""""""tab""""""""""""""""""""""""""
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
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
 execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
map <silent> [Tag]n :tabnext<CR>

""""""""""""""""""""""Unit.vim""""""""""""""""""""""
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-E> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


""""""""""""""""""""""IndentLine""""""""""""""""""""""
"let g:indentLine_faster = 1
"nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>


""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

