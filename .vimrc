let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'frazrepo/vim-rainbow', { 'for': 'python' }
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
" Plug 'sainnhe/everforest'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch', { 'for': 'python' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" ---------------------------
" Configure looks and visuals
" ---------------------------
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
set colorcolumn=80
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
set textwidth=78
" visual autocomplete for command menu
set wildmenu
" enable syntax processing
syntax enable
" hide status in favor of lightline
set noshowmode

set completeopt=menu,menuone,preview
set omnifunc=syntaxcomplete#Complete

" autocmd CursorHold * silent call CocAction('highlight')

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

command! NewUuid :execute "python3 import uuid; print(uuid.uuid4());"

" --------------------
" Set global variables
" --------------------
let g:gruvbox_italic='1'
let g:gruvbox_bold='1'
let g:gruvbox_italicize_comments='0'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_improved_warnings='0'
let g:gruvbox_improved_strings='0'
let g:gruvbox_underline='0'
let g:gruvbox_undercurl='1'
let g:lightline = {'colorscheme': 'wombat'}

" ---------------
" Set colorscheme
" ---------------
colorscheme gruvbox

" -------------
" Configure Coc
" -------------

" Refresh faster
set updatetime=500
