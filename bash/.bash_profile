# .bash_profile

# Get aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# For bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export PATH="$HOME/.cargo/bin:$PATH"
if [ -e /Users/sylvie/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/sylvie/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
