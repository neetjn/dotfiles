#!/usr/bin/env bash

##
# Author: John Nolette
#   This script installs my desired vim plugins.
##

PLUGINS=(
    https://github.com/scrooloose/nerdtree.git
    https://github.com/vim-python/python-syntax.git
    https://github.com/nvie/vim-flake8.git
    https://github.com/Valloric/YouCompleteMe.git
    https://github.com/ryym/vim-riot.git
    https://github.com/leafgarland/typescript-vim.git
    https://github.com/kchmck/vim-coffee-script.git
    https://github.com/mxw/vim-jsx.git
    https://github.com/pangloss/vim-javascript.git
    https://github.com/posva/vim-vue.git
    https://github.com/itchyny/vim-gitbranch.git
    https://github.com/tpope/vim-fugitive.git
    https://github.com/ctrlpvim/ctrlp.vim.git
    https://github.com/sgur/vim-editorconfig.git
)

for item in ${PLUGINS[*]}
do
  apt-vim install -y $item
done