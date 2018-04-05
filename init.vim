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
Plugin 'Shougo/deoplete.nvim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'lervag/vimtex'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
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

let g:tex_flavor='latex'                    " Set default to latex

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

highlight clear SignColumn

let g:limelight_conceal_ctermfg = 240

hi MatchParen cterm=none ctermbg=green ctermfg=blue " Better color to hiligh matching brackets

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

" ALE
nmap <Leader>a :ALEToggle<Enter>
let g:ale_lint_on_text_changed="insert"
let g:ale_lint_delay=800
let g:ale_sign_column_always=1

" Deoplete and Ultisnips
let g:deoplete#enable_at_startup = 1

let g:ulti_expand_or_jump_res = 0
let g:UltiSnipsEnableSnipMate = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

function! ExpandSnippetOrReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "<CR>"
    endif
endfunction

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap pumvisible() ? "=ExpandSnippetOrReturn()" : "<CR>"
inoremap pumvisible() ? "<C-n>" : check_back_space() ? "<TAB>" : deoplete#mappings#manual_complete()

" GoYo and LimeLight
nmap <F5> :Goyo <CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" ================ Load custom config =========================================
let g:customConfigFile = '~/.vim/custom.vim'

if !empty(glob(g:customConfigFile))
    exe 'source ' g:customConfigFile
endif
