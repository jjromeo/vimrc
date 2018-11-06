" Disable swp files
set noswapfile
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'epilande/vim-react-snippets'

colorscheme molokai
let g:rehash256 = 1
execute pathogen#infect()
syntax on
filetype plugin indent on

let NERDTreeWinSize = 18
let NERDTreeShowHidden=1
map <leader>nt :NERDTreeToggle<CR>
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set nocompatible
set modelines=0
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
nnoremap j gj
nnoremap k gk
let mapleader = ","
set list
set listchars=tab:▸\ ,eol:¬
set smartindent
set expandtab
"au FocusLost * :wa
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>1
nnoremap <leader>q <C-w>q
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
"nnoremap <CR> :wa<CR>:!!<CR>
inoremap jj <ESC>
"For syntastic linter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nmap yp :let @+ = expand("%")
"Run rspec on current file in tmux pane 2
nmap <leader>r :RunTests<CR>
command! -nargs=0 RunTests
      \ | execute ":silent !tmux send-keys -t 2 'rspec %' C-m"
      \ | execute ':redraw!'

nmap <leader>i :RunTest<CR>

nmap <leader>a :A<CR>
"Run test that line is currently on in rspec in tmux pane 2"
command! -nargs=0 RunTest
      \ | execute ":silent !tmux send-keys -t 2 'rspec %:" .(line('.') + 1) . "' C-m"
      \ | execute ':redraw!'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit="vertical"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|deps'
autocmd BufWritePre * %s/\s\+$//e
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
