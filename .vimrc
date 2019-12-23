call plug#begin('~/.vim/plugged')

" file management
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'webdevel/tabulous'
Plug 'mbbill/undotree'

" language implementation
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'ryym/vim-riot'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'evanleck/vim-svelte'
Plug 'groenewege/vim-less'
Plug 'ap/vim-css-color'
Plug 'ekalinin/dockerfile.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'wavded/vim-stylus'
Plug 'glench/vim-jinja2-syntax'
Plug 'chase/vim-ansible-yaml'
Plug 'chr4/nginx.vim'
Plug 'jnwhiteh/vim-golang'
Plug 'flowtype/vim-flow'
Plug 'lcolaholicl/vim-v'
Plug 'rust-lang/rust.vim'

" code syntax and standards
Plug 'nvie/vim-flake8'
Plug 'dgraham/vim-eslint'
Plug 'sgur/vim-editorconfig'
Plug 'prettier/vim-prettier'

" code utilities
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/goyo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Valloric/YouCompleteMe'
Plug 'raimondi/delimitmate'
Plug 'suan/vim-instant-markdown'
Plug 'heavenshell/vim-jsdoc'
Plug 'mattesgroeger/vim-bookmarks'
Plug 'amirh/html-autoclosetag'
Plug 'severin-lemaignan/vim-minimap'

" themes
Plug 'arcticicestudio/nord-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'drewtempelmeyer/palenight.vim', { 'as': 'palenight' }
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Sierra', { 'as': 'sierra' }
Plug 'flrnd/plastic.vim', { 'as': 'plastic' }
Plug 'relastle/bluewery.vim', { 'as': 'bluewery' }
Plug 'artanikin/vim-synthwave84', { 'as': 'synthwave84' }
Plug 'sainnhe/gruvbox-material'

" vim file icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

syntax on
set number
set relativenumber
set hlsearch
set splitbelow
set updatetime=100
set encoding=UTF-8
set ic

" enable true colors

" - xterm
if $TERM == "xterm-256color"
  set t_Co=256
endif

" - cloud9
if match($TERM, "screen")!=-1
  set term=xterm
endif

" - nvim
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" set theme
set background=dark
" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

" set lightline theme
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

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

" fuzzy file finder
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=1000
