"       (_)                            / _(_)      
" __   ___ _ __ ___     ___ ___  _ __ | |_ _  __ _ 
" \ \ / / | '_ ` _ \   / __/ _ \| '_ \|  _| |/ _` |
"  \ V /| | | | | | | | (_| (_) | | | | | | | (_| |
"   \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"                                             __/ |
"                                            |___/

"Vim config by hectoraldairah
set encoding=utf-8

"Set no compatible for vim features
set nocompatible

"Enable fyle detection
filetype on

"Enable plugins and load plugin for the detected file type.
filetype plugin on

"Load an indent file for the detected file type.
filetype indent on

"Turn syntax highlight on.
syntax on

" Mapping leader key
let mapleader = ','

"Set shif widhth to 4 spaces.
set shiftwidth=4

"Set tabm width to 4 columns
set tabstop=4

"Use spaces instead of tabs
set expandtab

"Do not save backup files
set nobackup

"Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

"While searching though a file incrementally highlight matching characters as you type.
set incsearch

"Ignore capital letters during search.
set ignorecase
"Override the ignorecase option if searching for capital letters.

"This will allow you to search specifically for capital letters.
set smartcase

" turn relative line numbers on
set relativenumber

" Show current line numver
set nu

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Splits more naturally
set splitbelow
set splitright

" Remove highlight on no search
set nohlsearch

" Incremental Search
set incsearch

" Scroll control
set scrolloff=8

"" Set extra colum for plugins
set signcolumn=yes

" Show current line 
set cursorline 
set cursorcolumn

"PLUGINS ----------------------------------------------
call plug#begin('~/.vim/plugged')

" Syntax
 Plug 'sheerun/vim-polyglot' 
 Plug 'glench/vim-jinja2-syntax'

" Formatting
 Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" Themes
 Plug 'morhetz/gruvbox'

" Status bar
 Plug 'itchyny/lightline.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

" IDE
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'sainnhe/everforest'

" NERDTree
 Plug 'preservim/nerdtree'
 Plug 'ryanoasis/vim-devicons'

" Auto complete 
 Plug 'neoclide/coc.nvim', {'branch': 'release'}

 " Git
 Plug 'tpope/vim-fugitive'

" Typing
 Plug 'jiangmiao/auto-pairs'
 Plug 'alvan/vim-closetag'

" FloatTerm
 Plug 'voldikss/vim-floaterm'

call plug#end()

"-------------------------------------------------------

" NERDTree --------------------------------------------

autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right"
"---
" AUTO CLOSE TAG CONFIG  ---------------------------------------------------------------- {{{ 
" 
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.njk'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" EVERFOREST THEME 

if has('termguicolors')
  set termguicolors
endif

set background=dark
let g:everforest_background = 'hard' 
let g:everforest_better_performance = 1
let g:everforest_enable_italic = 1
let g:everforest_ui_contrast = 'hight'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_current_word = 'bold'
let g:everforest_cursor = 'aqua'
colorscheme everforest


" AIRLINE CONFIG

let g:airline_theme = 'everforest'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" FZF 
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

"REMAPS ------------------------------------------------

"Save more faster with W 
noremap <leader>w :w<CR>

"NERD Tree maps
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Move line up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" FZF REMAPS
map <C-o> :GFiles<CR>
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>

" Git Fugitive REAMOPS
noremap <leader>gs :G<CR>
noremap <leader>gc :Git commit<CR>
noremap <leader>gp :Git push<CR>

" Coc remap tab
" use <tab> for trigger completion and navigate to the next complete item

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Move in splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

