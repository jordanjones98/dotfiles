# Path to your oh-my-zsh installation.
export ZSH=/Users/Jordan/.oh-my-zsh
export PATH="$HOME/.composer/vendor/bin:$PATH"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# source alias file
source ~/dotfiles/.aliases

eval "$(direnv hook zsh)"

export NVM_DIR="/Users/Jordan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
