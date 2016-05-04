# .bashrc

HISTCONTROL=ignoredups
HISTSIZE=100000

#Set prompt color and text.
PS1="\[\033[33m\][\u@macbook \w]$\[\033[0m\] "

#Alias ls to color output.
alias ls='ls -G'

alias canopy='/Users/tpoulsen/.canopy/bin/ipython --pylab'

alias opldb='psql -h 10.0.1.149 -U dbadmin newOPL'

alias cabal20='~/.cabal/bin/cabal'

export PATH="$PATH:$HOME/node_modules/.bin:$HOME/.nix-profile/bin:$HOME/.rvm/bin" # Add RVM to PATH for scripting

