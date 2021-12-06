set encoding=UTF-8

set nocompatible

"Enable type file detection. Vim will be able to try to detect the type of file in use.
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
" Add numbers to each line on the left-hand side.
set number

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

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

 " Syntax
 Plug 'sheerun/vim-polyglot'
 Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

 " Typing
 Plug 'jiangmiao/auto-pairs'
 Plug 'alvan/vim-closetag'

 " Auto Complete
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'glench/vim-jinja2-syntax'
 
 Plug 'preservim/nerdtree'
 Plug 'ryanoasis/vim-devicons'

" Themes
 Plug 'sainnhe/everforest'
 Plug 'morhetz/gruvbox'

" Status bar
 Plug 'itchyny/lightline.vim' 
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'

" IDE
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'airblade/vim-rooter'

" Git
 Plug 'tpope/vim-fugitive'

call plug#end()

" }}}
" Everforest theme config ------------------------------------------------{{{

autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

"" }}}


" NERDTree ---------------------------------------------------------------- {{{

autocmd VimEnter * NERDTree | wincmd p
let NERDTreeShowHidden=1

" }}}

" Status bar config  ---------------------------------------------------------------- {{{

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

" }}}

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
" }}}

" REMAPS ------------------------------------------------------------------ {{{

" Save more faster with w
noremap <leader>w :w<cr>  
" Move easi between splits

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move line up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" FZF REMAPS 
map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <Leader><Leader> :Commands<CR>
map <Leader>/ :execute 'Rg ' . input('Rg/')<CR>
map <Leader>l :BLines<CR>
map <Leader>gf :GF?<CR>

" }}}


" Git Fugitive REAMOPS
noremap <leader>gs :G<CR>
noremap <leader>gc :Git commit<CR>
noremap <leader>gp :Git push<CR>
