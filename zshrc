
PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=vim
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion
export PATH=/usr/local/sbin:$PATH
export DOCKER_HOST=tcp://172.16.232.129:2376
export DOCKER_CERT_PATH=/Users/jcorrigan/.docker/machine/machines/dinghy
export DOCKER_TLS_VERIFY=1
export DOCKER_MACHINE_NAME=dinghy

source /Users/jcorrigan/.dotfiles/antigen/antigen.zsh
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

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

antigen bundle felixr/docker-zsh-completion
antigen bundle sdurrheimer/docker-compose-zsh-completion

antigen bundle heroku

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme gallois

alias ls='ls -a'

# on () { last -2 $1 ; who | grep $1 }
dcr () {
  docker-compose run --rm $1
}

# Tell antigen that you're done.
antigen apply

