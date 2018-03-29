# Path to your oh-my-zsh installation.
export ZSH=/Users/Jordan/.oh-my-zsh
export PATH="$HOME/.composer/vendor/bin:$PATH:$HOME/dotfiles/scripts"
export TERM="screen-256color"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

function chpwd() {
    emulate -L zsh
    ls
}

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# source alias file
source ~/dotfiles/.aliases

export NVM_DIR="/Users/Jordan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
