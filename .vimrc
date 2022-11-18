call plug#begin('~/.vim/plugged')

" file management
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'webdevel/tabulous'
Plug 'mbbill/undotree'

" project organization
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" language implementation
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
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
Plug 'OmniSharp/omnisharp-vim'
Plug 'styled-components/vim-styled-components'
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
Plug 'elixir-editors/vim-elixir'
Plug 'hashivim/vim-terraform'
Plug 'gkz/vim-ls'
Plug 'ollykel/v-vim'
Plug 'ziglang/zig.vim'

" code syntax and standards
Plug 'nvie/vim-flake8'
Plug 'dgraham/vim-eslint'
Plug 'sgur/vim-editorconfig'
Plug 'prettier/vim-prettier'

" code utilities
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
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
Plug 'craigemery/vim-autotag'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'zivyangll/git-blame.vim'

" themes
Plug 'KurtPreston/vimcolors'
Plug 'sainnhe/gruvbox-material'
Plug 'AxolotlC/Fox.vim'
Plug 'junegunn/seoul256.vim'

" vim file icons
Plug 'ryanoasis/vim-devicons'

call plug#end()

" fix tmux color variance
set t_ut=

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
" colo seoul256
colo gruvbox

" set lightline theme
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'

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
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" editor settings
syntax on
set number
set hlsearch
set splitbelow
set updatetime=100
set encoding=UTF-8
set ic
set laststatus=2
set cursorline

" enable clipboard copy paste
set clipboard=unnamedplus

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

" - COC-VIM SETTINGS

let g:coc_global_extensions=['coc-json', 'coc-tsserver', 'coc-html', 'coc-css', 'coc-tailwindcss', 'coc-prettier', 'coc-python', 'coc-markdownlint', 'coc-omnisharp', 'coc-rls', 'coc-jest', 'coc-deno', 'coc-flutter']

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" blamer remap
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Crosshair Highlighting
set cursorline
set cursorcolumn
