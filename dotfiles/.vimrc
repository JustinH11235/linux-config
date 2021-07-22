" An example for a vimrc file.
"
" Maintainer:    Bram Moolenaar <Bram@vim.org>
" Last change:    2019 Dec 17
"
" To use it, copy it to
"           for Unix:  ~/.vimrc
"          for Amiga:  s:.vimrc
"     for MS-Windows:  $VIM\_vimrc
"          for Haiku:  ~/config/settings/vim/vimrc
"        for OpenVMS:  sys$login:.vimrc

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//


" vim-plug plugins
" auto-install plugins - https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'vim-syntastic/syntastic'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 1
autocmd BufWritePre *.js,*.mjs,*.ts,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

call plug#end()


filetype plugin indent on
set encoding=utf-8

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup        " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile    " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Custom Configuration:

set number relativenumber
syntax enable
" https://github.com/tomasr/molokai
colorscheme molokai
set showmode
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set showcmd
set lazyredraw
set showmatch
set incsearch
set hlsearch

set clipboard=unnamed " public copy/paste register
set ruler
set showcmd
set noswapfile " doesn't create swap files
set noshowmode " Needed for airline to not get in the way"
set shortmess+=c
set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode

set wildmenu "graphical auto complete menu

let mapleader=","
" alias to turn off highlighted search matches
nnoremap <leader><space> :nohlsearch<CR>
"nnoremap j gj
"nnoremap k gk
"make it so 0 goes to first non-whitespace
nnoremap 0 ^
nnoremap ^ 0
nnoremap gV `[v`]   

" folds
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent

