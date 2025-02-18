" --------------------
" Global mark registry
" --------------------
" V   .vimrc file
" Z   README for Zettelkasten
" L   README for literature notes
" P   README for permanent notes

" ---------------
" Tips & Tricks
" ---------------
" To check if a mapping exists, try
" :verbose nmap 'MAPPING' like :verbose nmap <leader>z
" :verbose imap 'MAPPING' like :verbose imap <leader>z
"
" To print the current file with full path, try CTRL-G

" ---------------
" Ale setup
" ---------------
let g:ale_fixers = {'rust': ['rustfmt']}
let g:ale_linters = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['pyright'], 'rust': ['rust_analyzer']}
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_rust_cargo_use_clippy = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 0
let g:palenight_terminal_italics = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_italicize_comments = 1
" let g:gruvbox_italicize_strings = 1

" ---------------
" Configure Plugs
" ---------------
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | source $MYVIMRC | endif

call plug#begin()

" Theme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
" Plug 'morhetz/gruvbox'

" IDE
Plug 'dense-analysis/ale', { 'for': ['css', 'go', 'html', 'javascript', 'python', 'rust', 'typescript', 'vim'] }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'on': ['FZF', 'Rg'] }
Plug 'junegunn/fzf.vim', { 'on': ['FZF', 'Rg'] }
Plug 'tpope/vim-commentary', { 'for': ['css', 'go', 'html', 'javascript', 'python', 'rust', 'typescript', 'vim'] }
Plug 'tpope/vim-dispatch', { 'for': ['css', 'go', 'html', 'javascript', 'python', 'rust', 'typescript', 'vim'] }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Languages
Plug 'SirVer/ultisnips', { 'for': ['go', 'python', 'rust', 'typescript'] }
Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'vim-python/python-syntax', { 'for': 'python' }
" Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx'] }
" Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'jsx'] }
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

call plug#end()

set encoding=utf-8
set hidden
set nobackup nowritebackup
set updatetime=100
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
set foldmethod=syntax
" 10 nested fold max
set foldnestmax=10
" highlight matches, search as you type
set hlsearch incsearch
" view the statusline
set laststatus=2
" redraw only when we need to
set lazyredraw
" allow newer features not compatible with old vi
set nocompatible
" Disable swap files
set noswapfile
" use relative line numbers
set relativenumber number
" search everything
set path=**
" show line and column number
set ruler
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
" Enable built-in fuzzy command-line completion
set wildoptions+=fuzzy
" ignore directory and file patterns when searching for files
set wildignore+=**/node_modules/**,**/target/**,**/.git/**,**/__pycache__/**,**/.mypy_cache/**,*.DS_Store,*.pdf,*.jpg,*.jpeg,*.png,*.ico
" set wildignore+=**/node_modules/**
" set wildignore+=**/.git/**
" set wildignore+=**/__pycache__/**
" set wildignore+=**/.mypy_cache/**
" set wildignore+=*.DS_Store
" set wildignore+=*.pdf
" set wildignore+=*.jpg
" set wildignore+=*.jpeg
" set wildignore+=*.png
" set wildignore+=*.ico
" check spelling
" set spell spelllang=en_us
set termguicolors
" hide status in favor of airline/lightline
set noshowmode
" Make backspace work like other programs
set backspace=indent,eol,start
" Set Airline theme
" let g:airline_theme='term'
" enable syntax processing
syntax enable

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
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" ---------------
" Set colorscheme
" ---------------
" let g:python_highlight_all=1
" let g:python_highlight_space_errors=1
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_hls_cursor='bright_red'
" let g:gruvbox_transparent_bg=1
" let g:gruvbox_improved_strings=0
" let g:gruvbox_improved_warnings=1
" let g:gruvbox_invert_selection=0
" let g:gruvbox_invert_signs=1
" let g:seoul256_background = 234
" colorscheme seoul256
set background=dark
" colorscheme gruvbox
colorscheme palenight
" highlight Cursorline ctermbg=black
highlight CursorLine guibg=#4B0070
" Cursor         xxx ctermfg=235 ctermbg=39 guifg=#292D3E guibg=#82b1ff
highlight Search cterm=NONE ctermfg=black ctermbg=white

" ----------
" IDE config
" ----------
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
        lclose
        pclose
    endif
endfunction

" ----------------------
" Configure zettelkasten
" ----------------------
function! NewJournal()
    let absFilePath = $HOME . "/projects/notes/zettelkasten/journal/" . strftime("%Y-%m-%d") . ".md"
    echo absFilePath
    execute ":e" absFilePath
    execute "normal! G"
    execute "put!='## ' . strftime('%Y-%m-%d')"
    execute "normal! Go"
    startinsert!
endfunction

nnoremap <leader>j :call NewJournal()<CR>

function! NewZettelkastenNote()
    let relativeFilePath = "./" . trim(tolower(system("uuidgen"))) . ".md"
    call writefile([], relativeFilePath)
    execute "normal! a[](" . relativeFilePath . ")"
    execute "normal! F]"
    startinsert
endfunction

nnoremap <silent> <leader>z :call NewZettelkastenNote()<CR>
inoremap <silent> <leader>z <ESC>:call NewZettelkastenNote()<CR>

nnoremap <silent> <F2>  :ALERename<CR>
nnoremap <silent> <F3>  :ALEGoToDefinition<CR>
nnoremap <silent> <F4>  :ALESymbolSearch <C-r><C-w><CR>
nnoremap <silent> <F5>  :Dispatch!<CR>
nnoremap <silent> <F6>  :call ToggleQuickFix()<CR>
nnoremap <silent> <F7>  :Make<CR>
nnoremap <silent> <F8>  :ALELint<CR>
nnoremap <silent> <F10> :ALEInfo<CR>

nnoremap <silent> <Esc> :let @/ = ""<CR><Esc>
nnoremap <silent> <C-s> :source ~/.vimrc<CR><C-s>

" Use Enter to select from popup menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
" Use Tab to select from popup menu
inoremap <expr> <TAB> pumvisible() ? "\<C-Y>" : "\<TAB>"
" Use ALEHover on current word
nnoremap <silent> K :ALEHover<CR>

" Use Vim 8 job support for vim-dispatch
let g:dispatch_no_tmux_make = 1
let g:dispatch_no_tmux_start = 1

" ---------
" UltiSnips
" ---------
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"
" Load UltiSnips into runtimepath for its help files
set runtimepath+=~/.vim/plugged/ultisnips

nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>F :FZF<CR>

map <Leader>sp :split<CR>
map <Leader>vs :vsplit<CR>

" --------
" NERDTree
" --------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <silent> <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:lightline = { 'colorscheme': 'palenight' }
