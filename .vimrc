call plug#begin('~/.vim/plugged')

" file management
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'webdevel/tabulous'

" language implementation
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'ryym/vim-riot'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte'

" code syntax and standards
Plug 'nvie/vim-flake8'
Plug 'dgraham/vim-eslint'
Plug 'sgur/vim-editorconfig'

" code utilities
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'itchyny/vim-gitbranch'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Valloric/YouCompleteMe'

" themes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

call plug#end()

syntax on
set number
set relativenumber
set hlsearch
set splitbelow

" set theme
set t_Co=256
colorscheme challenger_deep
hi Normal guibg=NONE ctermbg=NONE

" enable true colors
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" indentation
set tabstop=8
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set backspace=indent,eol,start
set tw=0

" highlight whitespace
set list
set listchars=
"set listchars+=eol:↲
set listchars+=tab:→\
set listchars+=trail:∙
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:⣿
set showbreak=↪\
"if has('patch-7.4.710')
"   set listchars+=space:𐄙
"endif

" show hidden files with ctrpl
let g:ctrlp_show_hidden = 1

" enable python highlighting
let g:python_highlight_all = 1

" enable javascript plugins
let g:javascript_plugin_flow = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_jsdoc = 1

" require jsx for syntax highlighting
let g:jsx_ext_required = 1

" lint current file
noremap <leader>l  :make % <cr>:cwindow<cr>:redraw!<cr>

" lint and fix current file
noremap <leader>lf :make --fix % <cr>:cwindow<cr>:redraw!<cr>

" lightline color scheme
" set laststatus=2
" let g:lightline = { 'colorscheme': 'seoul256' }
