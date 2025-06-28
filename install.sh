#!/bin/bash
WORKING_DIR=$PWD

echo "Installing OhMyZSH"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing Tmux"
brew install tmux

echo "Creating .vimrc symlink"
ln -s $WORKING_DIR/.vimrc ~/.vimrc

echo "Creating .tmux.conf symlink"
ln -s $WORKING_DIR/.tmux.conf ~/.tmux.conf

echo 
ln -s $WORKING_DIR/.p10k.zsh ~/.p10k.zsh

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing Vim Plugins via Vundle"
vim +PluginInstall +qall


echo "Creating .tmux.conf symlink"
ls -s $WORKING_DIR/.tmux.conf ~/.tmux.conf

echo "Installing tmux"
sudo apt-get install -y tmux
