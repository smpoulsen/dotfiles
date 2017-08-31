# .bash_profile

# Get aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# For bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
