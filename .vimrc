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

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
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
Plug 'vim-python/python-syntax', { 'for': 'python' }

call plug#end()

" ---------------------------
" Configure looks and visuals
" ---------------------------
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
" hide status in favor of lightline
set noshowmode

set completeopt=menu,menuone,preview
set omnifunc=syntaxcomplete#Complete


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
let g:gruvbox_bold='0'
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
let g:python_highlight_class_vars=1
let g:python_highlight_all=1
let g:python_highlight_func_calls=1
let g:python_highlight_space_errors=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_hls_cursor='blue'
colorscheme gruvbox

" ---------------
" Set colorscheme
" ---------------

" Always move by display lines (wrapped)
noremap j gj
noremap k gk

" Center line vertically when repeating a search
nnoremap n nzz
nnoremap N Nzz

" -------------
" Configure Coc
" -------------

autocmd CursorHold * silent call CocAction('highlight')

let g:coc_global_extensions =
            \ [
            \ 'coc-json',
            \ 'coc-pyright',
            \ 'coc-rls',
            \ 'coc-rust-analyzer',
            \ 'coc-tsserver',
            \ ]

" Refresh faster
set updatetime=500

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
