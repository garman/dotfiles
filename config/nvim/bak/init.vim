set nocompatible              " be iMproved, required
filetype off                  " required

set linespace=5
set relativenumber
set completeopt-=preview
set mouse+=a
set autoread
set timeoutlen=1000 ttimeoutlen=0
" set cursorline
set guicursor=i:block
:imap jk <Esc>

syntax on
set t_Co=256
syntax enable

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" don't render special chars (tabs, trails, ...)
set nolist
" lazy drawing
set lazyredraw
set ttyfast
set clipboard=unnamed

" ignore case when searching
set ignorecase
" unless there is a capital letter in it
set smartcase

" Open NERDTree and move cursor out of it
nnoremap <F4> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

let mapleader=','

" setup Plug
call plug#begin('~/.config/nvim/bundle')

Plug 'projekt0n/github-nvim-theme'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go'
Plug 'tpope/vim-sensible'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'KurtPreston/vim-autoformat-rails'
Plug 'airblade/vim-gitgutter'
Plug 'mdempsky/gocode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-test/vim-test'
Plug 'voldikss/vim-floaterm'
Plug 'vim-ruby/vim-ruby'
Plug 'wojciechkepka/vim-github-dark'
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim'
Plug 'github/copilot.vim'
Plug 'doums/darcula'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arzg/vim-colors-xcode'
Plug 'YorickPeterse/vim-paper'
Plug 'fatih/molokai'
Plug 'ojroques/vim-oscyank'
Plug 'tomasiser/vim-code-dark'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

filetype plugin indent on

" A bunch of theme/color stuff
colorscheme github_dark_high_contrast

" Highlight the 119th character in white. 118 is max line length
highlight colorcolumn ctermbg=white guibg=white
call matchadd('ColorColumn', '\%119v', 100)

" Airline config
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 0

map ;; :Files<CR>
map <Space> :nohl<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

noremap fd :Ag<CR>
noremap ft :Tags<CR>
noremap ff :BTags<CR>
noremap <C-B> <C-]>

" vim tabs
noremap <Leader>t :<C-u>tabnew<CR>
noremap <C-T> :<C-u>tabnew<CR>
noremap <Tab> :<C-u>tabnext<CR>
noremap <S-Tab> :<C-u>tabprevious<CR>

noremap vv :<C-u>vsplit<CR>
noremap tt :<C-u>split<CR>
noremap fi :BLines<CR>
noremap cl :q<CR>

" Comment lines
noremap <C-c> :<C-u>'<,'>Commentary<CR>

" Moving from pane to pane with CTRL+{vim keys}
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-l> <C-x><C-o>
vnoremap < <gv
vnoremap > >gv

" Format rails and ruby
au BufWrite ruby silent! call AutoFormatRails()
autocmd BufWritePre *.rb :%s/\s\+$//e

" Testing
noremap tf :TestFile<CR>
noremap tn :TestNearest<CR>
let test#strategy='floaterm'
let g:floaterm_wintype='split'

noremap <Leader>q :q<CR>
noremap <Leader>w :w<CR>
nnoremap ; :

nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>
nnoremap <Leader>* :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

autocmd InsertEnter * set guicursor=i:ver100-iCursor
autocmd InsertEnter * set guicursor+=i:blinkon100

" Spaces over tabs, and per filetype specifications
set expandtab
autocmd Filetype typescript setlocal tabstop=2
autocmd Filetype typescript setlocal shiftwidth=2
autocmd Filetype css setlocal tabstop=2
autocmd Filetype css setlocal shiftwidth=2
autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2
autocmd Filetype go setlocal tabstop=4
autocmd Filetype go setlocal shiftwidth=4
autocmd Filetype scss setlocal tabstop=2
autocmd Filetype scss setlocal shiftwidth=2
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
au FileType javascript setl indentexpr=
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
let g:oscyank_term = 'tmux'

" Go stuff, just kinda kicking around
noremap <Leader>im :GoImplements<CR>
noremap <Leader>c :GoCallers<CR>
noremap <F5> :GoBuild<CR>
noremap <Leader>b :w<CR>:GoBuild<CR>
let g:go_fmt_command = "goimports"
let g:go_doc_popup_window = 1
let g:go_code_completion_enabled = 1
