syntax on

set shell=/bin/zsh
set nocompatible
set smartindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set backspace=indent,eol,start
set number relativenumber
set showcmd
set incsearch
set nohlsearch
set cursorline

set shortmess+=aI

set mouse=
set colorcolumn=
set completeopt-=preview

set colorcolumn=80

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set guifont=Inconsolata

"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fireplace'
Plugin 'keith/swift.vim'
Plugin 'wikitopian/hardmode'
Plugin 'posva/vim-vue'
Plugin 'junegunn/fzf.vim'
Plugin 'cohama/lexima.vim'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()
"-------------- PLUGINS END --------------------
filetype plugin indent on

"----- GENERAL SETTINGS-------
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_alt_sep=''
let g:solarized_diffmode='low'
set background=light
colorscheme solarized

"-----------DIFF COLORS SETTING--------
exe "hi! DiffAdd        term=none cterm=none ctermfg=none ctermbg=7"
exe "hi! DiffChange     term=none cterm=none ctermfg=none ctermbg=7"
exe "hi! DiffDelete     term=bold cterm=bold ctermfg=1"
exe "hi! DiffText       term=none cterm=underline ctermfg=none ctermbg=7"

"-----------FZF SETTINGS---------------
nnoremap <C-P> :Files<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Keyword'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"-----------CTAGS----------------------
au FileType python set tags^=$VIRTUAL_ENV/tags

"-----------YCM SETTINGS---------------
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_server_python_interpreter = 'python3'
let g:ycm_confirm_extra_conf = 0

"-----------EXTRA KEY MAPPINGS---------
nnoremap <leader><space> :noh<CR>
nnoremap <leader>q :Bclose<CR>
nnoremap <leader>Q :bufdo Bclose<CR>
nnoremap + <C-a>
nnoremap - <C-x>
nmap <silent> <leader>\ :redraw!<CR>

"-----------PANE MOVEMENT--------------
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

"-----------MARKDOWN PREVIEW-----------
let vim_markdown_preview_hotkey='<C-m>'

"-----------HARD MODE------------------
autocmd VimEnter,BufNewFile,BufReadPost * silent! call NoArrows()
autocmd VimEnter,BufNewFile,BufReadPost * silent! call NoBackspace()
let delimitMate_expand_cr = 0

"-----------DOC MODE-------------------
nnoremap <leader>d :ToggleDocmode<CR>

"-----------VUE.JS SUPPORT-------------
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css
autocmd FileType *.vue syntax sync fromstart

"-----------RAINBOW PARENTHESES--------
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
