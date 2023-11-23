" ----------
" ALE config
" ----------
let g:ale_close_preview_on_insert = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
" \   'html': ['prettier'],
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['autoflake', 'black', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['remove_trailing_lines', 'rustfmt', 'trim_whitespace'],
\   'scss': ['prettier'],
\   'typescript': ['prettier', 'tslint'],
\ }
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pyright', 'flake8', 'mypy'],
\   'rust': ['cspell', 'cargo'],
\ }
let g:ale_rust_cargo_use_clippy = 1
let g:airline#extensions#ale#enabled = 1

" ---------------
" Configure Plugs
" ---------------

call plug#begin()

" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" IDE
Plug 'SirVer/ultisnips'
Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Languages
Plug 'SirVer/ultisnips', { 'for': ['go', 'python'] }
Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx'] }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'jsx'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

call plug#end()

set encoding=utf-8
set hidden
set nobackup
set nowritebackup
let g:rainbow_active = 1
" load filetype-specific indent files
filetype plugin indent on
" set leader
let mapleader = ","
" set number of colors
set t_Co=256
" copy indent to next line
set autoindent
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
" search as you type
set incsearch
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
" Set Airline theme
let g:airline_theme='term'
let g:airline_powerline_fonts = 1

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

" ----------
" IDE config
" ----------
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <F2>  :ALERename<CR>
nnoremap <silent> <F3>  :ALESymbolSearch <C-r><C-w><CR>
nnoremap <silent> <F4>  :ALEGoToDefinition<CR>
nnoremap <silent> <F5>  :Dispatch<CR>
nnoremap <silent> <F6>  :call ToggleQuickFix()<CR>
nnoremap <silent> <F7>  :Make<CR>
nnoremap <silent> <F8>  :ALELint<CR>
nnoremap <silent> <F10> :ALEInfo<CR>

nnoremap <silent> <leader>N <Plug>(ale_previous_wrap)
nnoremap <silent> <leader>n <Plug>(ale_next_wrap)

" Use Vim 8 job support for vim-dispatch
let g:dispatch_no_tmux_make = 1
let g:dispatch_no_tmux_start = 1

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"
