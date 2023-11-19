let g:ale_linters =
            \ {
            \   'rust': ['analyzer', 'cargo', 'rls'],
            \   'javascript': ['eslint']
            \ }
let g:ale_fixers =
            \ {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'rust': ['rustfmt'],
            \   'javascript': ['eslint'],
            \   'typescript': ['prettier', 'tslint'],
            \   'scss': ['prettier'],
            \   'html': ['prettier'],
            \ }

" ---------------
" Configure Plugs
" ---------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'morhetz/gruvbox'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'rust-lang/rust.vim'

call plug#end()

set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set background=dark
let g:rainbow_active = 1
" load filetype-specific indent files
filetype plugin indent on
" set leader
let mapleader = ","
" set number of colors
set t_Co=256
" copy indent to next line
set autoindent
" show vertical line at column value
set colorcolumn=100
" highlight current cursor line
set cursorline
" enter spaces when tab is pressed
set expandtab
" enable folding
set foldenable
" open most folds by default
set foldlevelstart=10
" fold based on indent level
set foldmethod=indent
" 10 nested fold max
set foldnestmax=10
" highlight matches
set hlsearch
" view the statusline
set laststatus=2
" redraw only when we need to
set lazyredraw
" allow newer features not compatible with old vi
set nocompatible
" Disable swap files
set noswapfile
" show line numbers
set number
" search everything
set path=**
" show line and column number
set ruler
" set shell=/usr/local/bin/zsh
" number of spaces for auto indent
set shiftwidth=4
" show command in bottom bar
set showcmd
" always show sign column
set signcolumn=yes
" use 4 spaces as flexible tabs
set softtabstop=4
" vertical splits split right
set splitright
" splits split below
set splitbelow
" use 4 spaces to represent tab
set tabstop=4
" break lines for line length increases
set textwidth=100
" visual autocomplete for command menu
set wildmenu
" ignore file patterns when searching for files
set wildignore+=**/node_modules/**,**/.git/**,**/__pycache__/**
" Enable built-in fuzzy command-line completion
set wildoptions+=fuzzy
" enable syntax processing
syntax enable
" hide status in favor of airline/lightline
set noshowmode
" Make backspace work like other programs
set backspace=indent,eol,start

" ----------------------
" Configure cursor shape
" ----------------------
" Cursor settings:
" 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
let &t_SI.="\e[1 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" ---------------
" Set colorscheme
" ---------------
let g:python_highlight_class_vars=1
let g:python_highlight_all=1
let g:python_highlight_func_calls=1
let g:python_highlight_space_errors=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_hls_cursor='blue'
colorscheme gruvbox

" ----------------------
" Configure zettelkasten
" ----------------------
let g:zettelkasten = $HOME . '/projects/notes'

command! -nargs=1 NewFleeting :execute ":e" zettelkasten . "/fleeting_notes/<args>_" . strftime("%Y-%m-%d-%H%M") . ".md"
command! -nargs=1 NewLit :execute ":e" zettelkasten . "/literature_notes/<args>_" . strftime("%Y-%m-%d-%H%M") . ".md"

command! NewJournal :execute ":e" zettelkasten . "/journal_notes/" . strftime("%Y-%m-%d") . ".md" |
            \ :execute "normal! G" |
            \ :execute "put!=strftime('%Y-%m-%d %H%M')" |
            \ :execute "normal! Go" |
            \ startinsert!

nnoremap <leader>nf :NewFleeting
nnoremap <leader>nl :NewLit

nnoremap <leader>nj :NewJournal<CR>

