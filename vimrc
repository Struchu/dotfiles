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
set tabpagemax=100

set shortmess+=aI

set mouse=
set completeopt-=preview

set splitbelow splitright

set colorcolumn=80,100

filetype off
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set guifont=Inconsolata

"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'keith/swift.vim'
Plugin 'wikitopian/hardmode'
Plugin 'posva/vim-vue'
Plugin 'junegunn/fzf.vim'
Plugin 'cohama/lexima.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-fireplace'
Plugin 'tyru/caw.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'sheerun/vim-polyglot'

call vundle#end()
"-------------- PLUGINS END --------------------
filetype plugin indent on

"----- GENERAL SETTINGS-------
set laststatus=2
set background=light
colorscheme solarized

"----- LIGHTLINE SETTINGS----
let g:lightline = {
    \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
    \ },
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch' ],
    \             [ 'relativepath', 'modified' ]],
    \   'right': [ [ 'syntastic', 'lineinfo' ],
    \              [ 'percent' ]]
    \ },
    \ 'inactive': {
    \   'left': [ [ 'gitbranch' ], [ 'relativepath', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

"-----------TRAILING WHITESPACES-------

highlight TrailingWhitespaces ctermbg=red guibg=red
match TrailingWhitespaces /\s\+$/

nnoremap <leader>tw :%s/\s\+$//g<CR>

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

"-----------VIMWIKI--------------------
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]

"-----------CTAGS----------------------
au FileType python set tags^=$VIRTUAL_ENV/tags

"-----------GITGUTTER------------------
highlight SignColumn ctermbg=7
highlight GitGutterAdd ctermbg=7 ctermfg=2
highlight GitGutterDelete ctermbg=7 ctermfg=1
highlight GitGutterChange ctermbg=7 ctermfg=3

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
nnoremap <leader>ee :Gcommit --allow-empty<CR>

"-----------PANE MOVEMENT--------------
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

nmap <leader>tt :term<CR>
nmap <leader>tv :vert term<CR>

nnoremap <leader>sr <C-W>r

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

"-----------CLOJURE--------------------
let g:iced_enable_default_key_mappings = v:true

"-----------RAINBOW PARENTHESES--------
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
