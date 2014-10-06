#!/bin/sh

cd ~/
mkdir .vim
# get oh-my-zsh
curl -L http://install.ohmyz.sh | sh
git clone https://github.com/scusy/convinient-dots .cdots
ln -s  cdots/vimrc .vimrc
ln -s  cdots/gvimrc .gvimrc
ln -s  cdots/tmux.conf .tmux.confgv
rm .zshrc
ln -s  cdots/zshrc .zshrc
#get noebundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | s://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh



