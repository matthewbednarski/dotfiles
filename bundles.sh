#!/bin/bash


mkdir -p ~/.vim/bundle
cdold=$(pwd)
cd ~/.vim/bundle


#  ctrlp.vim
git clone ssh://git@github.com/kien/ctrlp.vim 


#  syntastic
git clone ssh://git@github.com/scrooloose/syntastic 


#  vim-colors-solarized
git clone git://github.com/altercation/vim-colors-solarized.git 


#  vim-json
git clone git://github.com/elzr/vim-json 


#  matchit
git clone git://github.com/tmhedberg/matchit 


#  tagbar
git clone ssh://git@github.com/majutsushi/tagbar 


#  vim-foldsearch
git clone ssh://git@github.com/embear/vim-foldsearch 


#  vim-surround
git clone ssh://git@github.com/tpope/vim-surround 


#  nerdtree
git clone ssh://git@github.com/scrooloose/nerdtree 


#  tcomment_vim
git clone ssh://git@github.com/tomtom/tcomment_vim 


#  vim-fugitive
git clone ssh://git@github.com/tpope/vim-fugitive 


#  vim-xml
git clone ssh://git@github.com/matthewbednarski/vim-xml 


#  supertab
git clone ssh://git@github.com/ervandew/supertab 


#  vim-airline
git clone ssh://git@github.com/bling/vim-airline 


#  vim-jsbeautify
git clone git://github.com/maksimr/vim-jsbeautify 
cd ~/.vim/bundle/vim-jsbeautify
git submodule update --init --recursive
cd ~/.vim/bundle


#  xml-folding
git clone git://github.com/vim-scripts/XML-Folding 
cd $cdold
