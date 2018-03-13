" ================ Plugins ====================================================
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'drmingdrmer/vim-toggle-quickfix'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'w0rp/ale'
call vundle#end()

" ================ General ====================================================
let g:mapleader = ","

filetype plugin indent on
set nocompatible
syntax enable
set number relativenumber
set hidden
set clipboard=unnamed

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

set directory^=$HOME/.vim/tmp//             " Set swap file directory

" ================ Indentation ================================================
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" ================ UI =========================================================
set cursorline
highlight CursorLine ctermbg=Black cterm=NONE
set wildmenu
set showmatch
set mouse=a

set splitbelow
set splitright

" ================ Search =====================================================
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase

" ================ Custom mappings ============================================
" Windows moving
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Buffers moving
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" - and + to resize horizontal splits
map - <C-W>-
map + <C-W>+
" alt-< or alt-> for vertical splits
map <Leader>+ <C-W>>
map <Leader>- <C-W><

" Tab switching
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" ================ Plugins settings ===========================================
" airline
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" NERDTree
let g:NERDTreeChDirMode = 2
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let NERDTreeMapActivateNode = '<space>'
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle-quickfix
nmap <C-g> <Plug>window:quickfix:toggle

" toggle ALE
nmap <Leader>a :ALEToggle<Enter>
" ================ Load custom config =========================================
let g:customConfigFile = '~/.vim/custom.vim'

if !empty(glob(g:customConfigFile))
    exe 'source ' g:customConfigFile
endif
