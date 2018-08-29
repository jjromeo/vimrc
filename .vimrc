set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'jgdavey/vim-blockle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'
Plugin 'stefanoverna/vim-i18n'
Plugin 'tpope/vim-rails'
Plugin 'christoomey/vim-rfactory'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'rorymckinley/vim-rubyhash'
Plugin 'slim-template/vim-slim'
Plugin 'honza/vim-snippets'
Plugin 'mattn/webapi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
colorscheme molokai
let g:rehash256 = 1
syntax on
filetype plugin indent on
let NERDTreeWinSize = 18
autocmd BufWritePre * %s/\s\+$//e
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
map <leader>n :NERDTreeToggle<CR>
"For syntastic linter
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nmap yp :let @+ = expand("%")
"Run rspec on current file in tmux pane 2
nmap <leader>r :RunTests<CR>
command! -nargs=0 RunTests
      \ | execute ":silent !tmux send-keys -t 2 'be rspec %' C-m"
      \ | execute ':redraw!'

nmap <leader>i :RunTest<CR>
"Run test that line is currently on in rspec in tmux pane 2"
command! -nargs=0 RunTest
      \ | execute ":silent !tmux send-keys -t 2 'be rspec %:" .(line('.') + 1) . "' C-m"
      \ | execute ':redraw!'

nmap <leader>a :A<CR>
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

let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsEditSplit="vertical"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" This is to allow vim to copy and paste between tmux
set clipboard=unnamed

" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nnoremap <Leader>f :RVfactory<CR>
" speed up vim with old regex engine
set re=1

" No annoying swap files
set noswapfile

autocmd QuickFixCmdPost *grep* cwindow
let g:rubyhash_map_keys = 0
nnoremap <Leader>hp :call ToSymbolKeysLinewise()<CR>
nnoremap <Leader>hy :call ToStringKeysLinewise()<CR>
nnoremap <Leader>hh :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

let g:rails_projections = {
      \  'app/*.rb': {
      \     'alternate': 'spec/{}_spec.rb',
      \     'type': 'source'
      \   },
      \  'spec/*_spec.rb': {
      \     'alternate': 'app/{}.rb',
      \     'type': 'test'
      \   }
      \}

