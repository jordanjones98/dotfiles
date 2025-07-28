#!/bin/bash
WORKING_DIR=$PWD

echo "Installing OhMyZSH"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing NVIM"
brew install neovim

echo "Installing Tmux"
brew install tmux

echo "Installing NVM"
brew install nvm

excho "Installing Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo "Creating .vimrc symlink"
ln -s $WORKING_DIR/.vimrc ~/.vimrc

echo "Creating .tmux.conf symlink"
ln -s $WORKING_DIR/.tmux.conf ~/.tmux.conf

echo "Creating p10k symlink"
ln -s $WORKING_DIR/.p10k.zsh ~/.p10k.zsh

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing Vim Plugins via Vundle"
vim +PluginInstall +qall


echo "Creating .tmux.conf symlink"
ls -s $WORKING_DIR/.tmux.conf ~/.tmux.conf

echo "Installing BAT"
brew install bat

echo "Installing FZF"
brew install fzf

echo "Installing thefuck"
brew install fzf

echo "Creating ZSHRC File"
touch ~/.zshrc && echo "source $WORKING_DIR/.zshrc" >> ~/.zshrc
