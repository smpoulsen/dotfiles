# .bash_profile

# Get aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# For bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export PATH="/Library/Developer:/Users/tpoulsen/.cabal/bin:/Users/tpoulsen/software/julia:$PATH"

# Added by Canopy installer on 2014-01-23
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
#VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/tpoulsen/.canopy/bin/activate

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
