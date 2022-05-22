let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow', { 'for': 'python' }

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

" ------------------------------------------------------------------------------
" Configure looks and visuals
" ------------------------------------------------------------------------------
let g:rainbow_active = 1
filetype plugin indent on	            " load filetype-specific indent files
let mapleader = ","                     " set leader
set t_Co=256                            " set number of colors
set autoindent				            " copy indent to next line
set background=dark                     " use light/dark background
set colorcolumn=80                      " show vertical line at column value
set cursorline				            " highlight current cursor line
set expandtab				            " enter spaces when tab is pressed
set foldenable				            " enable folding
set foldlevelstart=10		            " open most folds by default
set foldmethod=indent		            " fold based on indent level
set foldnestmax=10			            " 10 nested fold max
set hlsearch				            " highlight matches
set laststatus=2                        " view the statusline
set lazyredraw				            " redraw only when we need to
set nocompatible                        " not compatible with old vi
set number				                " show line numbers
set path=**                             " search everything
set ruler				                " show line and column number
set shell=/usr/local/bin/zsh            " set shell program
set shiftwidth=4			            " number of spaces for auto indent
set showcmd				                " show command in bottom bar
set signcolumn=yes                      " always show sign column
set softtabstop=4                       " use 4 spaces as flexible tabs
set splitright                          " vertical splits split right
set splitbelow                          " splits split below
set tabstop=4				            " use 4 spaces to represent tab
set textwidth=78			            " break lines for line length increases
set wildmenu				            " visual autocomplete for command menu
syntax enable				            " enable syntax processing
set noshowmode                          " hide status in favor of lightline

set completeopt=menu,menuone,preview
set omnifunc=syntaxcomplete#Complete

" autocmd CursorHold * silent call CocAction('highlight')

" ------------------------------------------------------------------------------
" Configure cursor shape
" ------------------------------------------------------------------------------
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

" ------------------------------------------------------------------------------
" Configure zettelkasten
" ------------------------------------------------------------------------------
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
" ->
let g:gruvbox_italic='1'
let g:gruvbox_bold='1'
let g:gruvbox_italicize_comments='0'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_improved_warnings='0'
let g:gruvbox_improved_strings='0'
let g:gruvbox_underline='0'
let g:gruvbox_undercurl='1'
colorscheme gruvbox
let g:lightline = {'colorscheme': 'wombat'}
