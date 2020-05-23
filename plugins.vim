" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{' 
    Plug 'jiangmiao/auto-pairs'
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Rainbow Parentheses
    Plug 'junegunn/rainbow_parentheses.vim'
    " Commentary
    Plug 'tpope/vim-commentary'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " OneDrak Theme
    Plug 'joshdick/onedark.vim'
    " Startify
    Plug 'mhinz/vim-startify'
    " Which key
    Plug 'liuchengxu/vim-which-key'

call plug#end()
