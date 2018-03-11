#!/bin/bash
WORKING_DIR=$PWD
echo "Creating .vimrc symlink"
ln -s $WORKING_DIR/.vimrc ~/.vimrc

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing Vim Plugins via Vundle"
vim +PluginInstall +qall

echo "Installing tmux"
sudo apt-get install -y tmux

echo "Creating .tmux.conf symlink"
ls -s $WORKING_DIR/.tmux.conf ~/.tmux.conf
