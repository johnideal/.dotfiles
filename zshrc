
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=mvim

source /Users/johnjcorrigan/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle brew
antigen bundle git

antigen bundle bundler
antigen bundle rails
antigen bundle rake
antigen bundle ruby
antigen bundle rvm

antigen bundle node
antigen bundle npm

antigen bundle heroku

antigen bundle composer

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme gallois

alias ls='ls -a'

# Tell antigen that you're done.
antigen apply
