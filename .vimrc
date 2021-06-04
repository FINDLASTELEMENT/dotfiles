set nocompatible              " be iMproved, required
filetype off                  " required
set autoindent
set cindent
set smartindent
set wrap
set nowrapscan
set nobackup
set noswapfile
set ruler
set shiftwidth=4
set nu
set hls
set ic
set tabstop=4
set lbr
set incsearch
set cursorline
set laststatus=2
set background=dark
set backspace=eol,start,indent
set history=1000
highlight Comment term=bold cterm=bold ctermfg=4
set mouse=a
set t_Co=256
set encoding=utf-8

let g:C_Ctrl_j = 'off'

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'neoclide/coc.nvim'
Plugin 'raimondi/delimitmate'
Plugin 'c.vim'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sjl/gundo.vim'

call vundle#end()

filetype plugin indent on

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_global_ycm_binary_path = 'python'
"set completeopt-=preview
let delimitMate_expand_cr = 1
let g:SimpylFold_docstring_preview=1

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

set encoding=utf-8

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"let python_highlight_all = 1
syntax on
set clipboard=unnamed

let g:airline#extensions#tabline#enabled = 1
		
inoremap jj <ESC>
let g:jedi#completions_enabled = 0

let g:ycm_min_num_of_chars_for_semantic_completion = 1

let regex = 're!' . repeat('\w', ycm_min_num_of_chars_for_semantic_completion) . '+'

let g:ycm_semantic_triggers = {'cpp': [regex], 'c': [regex], 'python': [regex]}

set pumheight=10
let g:asyncrun_open=10

tnoremap <Esc> <C-\><C-n>
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:clang_complete_macros = 1

command WQ wq
command Wq wq
command W w
command Q q

nnoremap <F2> :vs untitled<CR>
nnoremap <F3> :sp untitled<CR>
nnoremap <F4> :NERDTree<CR>
nnoremap <F6> :goto<CR>
nnoremap <F5> :GundoToggle<CR>

let g:ycm_clangd_args=['--header-insertion=never']
"let g:ycm_autoclose_preview_window_after_completion = 1

set termwinsize=10x0

set splitbelow

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_auto_loc_list = 0
let g:syntastic_exit_checks = 0

let g:ycm_show_diagnostics_ui = 0

let g:ycm_clangd_binary_path="/data/data/com.termux/files/usr/bin/clangd"
