#!/bin/bash


mkdir -p ~/.vim/bundle
cdold=$(pwd)
cd ~/.vim/bundle


#  ctrlp.vim
git clone ssh://git@github.com/kien/ctrlp.vim 


#  syntastic
git clone ssh://git@github.com/scrooloose/syntastic 


#  vim-airline
git clone ssh://git@github.com/bling/vim-airline 


#  vim-jsbeautify
git clone git://github.com/maksimr/vim-jsbeautify 
cd ~/.vim/bundle/vim-jsbeautify
git submodule update --init --recursive
cd ~/.vim/bundle


#  vim-xml
git clone ssh://git@github.com/matthewbednarski/vim-xml 


#  matchit
git clone git://github.com/tmhedberg/matchit 


#  tagbar
git clone ssh://git@github.com/majutsushi/tagbar 


#  vim-colors-solarized
git clone git://github.com/altercation/vim-colors-solarized.git 


#  vim-json
git clone git://github.com/elzr/vim-json 


#  XML-Folding
git clone git://github.com/vim-scripts/XML-Folding 


#  nerdtree
git clone ssh://git@github.com/scrooloose/nerdtree 


#  tcomment_vim
git clone ssh://git@github.com/tomtom/tcomment_vim 


#  vim-foldsearch
git clone ssh://git@github.com/embear/vim-foldsearch 


#  vim-pathogen
git clone git://github.com/tpope/vim-pathogen.git 


#  supertab
git clone ssh://git@github.com/ervandew/supertab 


#  tmuxline.vim
git clone git://github.com/edkolev/tmuxline.vim 


#  vim-fugitive
git clone ssh://git@github.com/tpope/vim-fugitive 


#  vim-surround
git clone ssh://git@github.com/tpope/vim-surround 
cd $cdold
