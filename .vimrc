" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
colorscheme molokai
let g:rehash256 = 1
execute pathogen#infect()
syntax on
filetype plugin indent on
let NERDTreeWinSize = 18 
autocmd vimenter * NERDTree
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
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
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
nnoremap <Tab> <C-W><C-W>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
"nnoremap <CR> :wa<CR>:!!<CR>
inoremap jj <ESC>
map <leader>n :NERDTreeToggle<CR>
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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
