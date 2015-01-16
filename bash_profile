export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:~/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

alias ls='ls -a'

alias jia1='ssh mint@109.107.36.139'
alias jia2='ssh mint@109.107.36.126'
alias jiw1='ssh mint@109.107.35.208'

alias jis1='ssh mint@109.107.36.1'

export TERM=xterm
export NODE_PATH=/usr/local/lib/node_modules
export EDITOR=mvim
export PATH=/usr/local/bin:$PATH
