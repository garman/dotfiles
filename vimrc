call plug#begin()
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
call plug#end()

set nocompatible              " be iMproved, required
filetype off                  " required
set expandtab
set runtimepath+=$GOROOT/misc/vim
set tabstop=2
set softtabstop=2
set shiftwidth=2
filetype plugin indent on
syntax on

:nmap \l :setlocal number!<CR>
:nmap \0 :set paste!<CR>

:set number
:imap jk <Esc>
map <F2> :w<CR>
map <F3> :q<CR>
map <C-p> :Files<CR>
nmap :wc :w<space>!ruby<space>-c
nmap ;wc :w<space>!ruby<space>-c
nmap <silent> <F4> :NERDTreeToggle<CR>
set background=dark

set t_Co=256

set scrolloff=5
set list
set noswapfile

:set hlsearch!
map <Space> :nohl<CR>
:set incsearch
:set ignorecase
:set smartcase

autocmd BufWritePre * :%s/\s\+$//e

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

:iabbrev </ </<C-X><C-O>

set pastetoggle=<F5>
nnoremap ; :

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" https://github.com/junegunn/vim-easy-align
" vipga=
xmap ga <Plug>(EasyAlign)
" gaip=
nmap ga <Plug>(EasyAlign)

:let mapleader = ","
" affected = if dry_run?
"  count_something
"else
"  do_something
"end
:let g:ruby_indent_assignment_style = 'variable'

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%101v', 100)

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++
