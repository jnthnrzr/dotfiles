" ---------------
" Configure Plugs
" ---------------

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

" Theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'psliwka/vim-smoothie'

" IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'frazrepo/vim-rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Languages
Plug 'SirVer/ultisnips', { 'for': ['go', 'python'] }
Plug 'alvan/vim-closetag', { 'for': ['html', 'jsx'] }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile', 'for': 'typescript'}
Plug 'neoclide/coc-json', { 'for': 'json'}
Plug 'fannheyward/coc-rust-analyzer', { 'do': 'yarn install --frozen-lockfile', 'for': 'rust' }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'jsx'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'vim-python/python-syntax', { 'for': 'python' }

call plug#end()

set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set updatetime=300
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
" use relative line numbers
set relativenumber
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
set wildignore+=**/node_modules/**
set wildignore+=**/.git/**
set wildignore+=**/__pycache__/**
set wildignore+=**/.mypy_cache/**
set wildignore+=*.DS_Store
set wildignore+=*.pdf
set wildignore+=*.jpg
set wildignore+=*.jpeg
set wildignore+=*.png
set wildignore+=*.ico
" check spelling
set spell spelllang=en_us
" enable syntax processing
syntax enable
" hide status in favor of airline/lightline
set noshowmode
" Make backspace work like other programs
set backspace=indent,eol,start
" Set Airline theme
let g:airline_theme='deus'
" let g:airline_solarized_bg='dark'

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
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" ---------------
" Set colorscheme
" ---------------
" let g:python_highlight_all=1
" let g:python_highlight_space_errors=1
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_hls_cursor='bright_red'
let g:gruvbox_transparent_bg=1
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_signs=1
set background=dark
colorscheme gruvbox
" highlight Cursorline ctermbg=black
highlight Search cterm=NONE ctermfg=black ctermbg=white

" ----------------------
" Configure zettelkasten
" ----------------------
let g:zettelkasten = $HOME . '/projects/notes'

command! NewJournal :execute ":e" zettelkasten . "/journal_notes/" . strftime("%Y-%m-%d") . ".md" |
            \ :execute "normal! G" |
            \ :execute "put!=strftime('%Y-%m-%d %H%M')" |
            \ :execute "normal! Go" |
            \ startinsert!

nnoremap <leader>nj :NewJournal<CR>

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

function! NewLiteratureNote()
    let relativeFilePath = "notes/literature/" . trim(tolower(system("uuidgen"))) . ".md"
    call writefile([], relativeFilePath)
    execute "normal! a[](" . relativeFilePath . ")"
    execute "normal! F]"
    startinsert
endfunction

nnoremap <leader>l :call NewLiteratureNote()<CR>
inoremap <silent> <leader>l <ESC>:call NewLiteratureNote()<CR>

function! NewPermanentNote()
    let noteId = trim(tolower(system("uuidgen")))
    execute "normal! i[](./notes/permanent/" . noteId . ".md)"
    execute "normal! F]"
    startinsert
endfunction

nnoremap <leader>np :call NewPermanentNote()<CR>

function! CreateNoteFile()
    " call writefile([], "foobar.txt")
endfunction

" nnoremap <silent> <F2>  :ALERename<CR>
" nnoremap <silent> <F3>  :ALEGoToDefinition<CR>
" nnoremap <silent> <F4>  :ALESymbolSearch <C-r><C-w><CR>
nnoremap <silent> <F5>  :Dispatch!<CR>
nnoremap <silent> <F6>  :call ToggleQuickFix()<CR>
nnoremap <silent> <F7>  :Make<CR>
" nnoremap <silent> <F8>  :ALELint<CR>
" nnoremap <silent> <F10> :ALEInfo<CR>

nnoremap <silent> <Esc> :noh<CR><Esc>
nnoremap <silent> <C-s> :source ~/.vimrc<CR><C-s>

" Use Vim 8 job support for vim-dispatch
let g:dispatch_no_tmux_make = 1
let g:dispatch_no_tmux_start = 1

let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"

nnoremap <silent> <Leader>f :Rg<CR>

" -------
" Gruvbox
" -------
" let g:gruvbox_hls_cursor='blue'

" nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
" nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" ---
" Coc
" ---
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> 
            \ coc#pum#visible() ? coc#pum#confirm() : 
            \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
