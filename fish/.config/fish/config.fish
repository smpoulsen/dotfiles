# Sylvie Poulsen
# 2019-2021

## Useful commands:

# Add something to $fish_user_paths:
# set fish_user_paths /Users/spoulsen/.nix-profile/bin $fish_user_paths

# Add something permanently to $fish_user_paths:
# set -U fish_user_paths /Users/spoulsen/.nix-profile/bin $fish_user_paths

# Remove something from $fish_user_paths (fish_user_paths is a 1-indexed list):
# set --erase fish_user_paths[index]

# Remove something permanently from $fish_user_paths:
# set --erase -U fish_user_paths[index]


## BEGIN CONFIG

# Add nix installed items to $PATH
#set fish_user_paths /Users/spoulsen/.nix-profile/bin $fish_user_paths
# Add brew installed items to $PATH
#set fish_user_paths /usr/local/sbin/ $fish_user_paths

# Pure theme configuration
# REF: https://github.com/rafaelrinaldi/pure#configuration
set pure_symbol_prompt λ

# Erlang shell history
set -gx ERL_AFLAGS "-kernel shell_history enabled"
# Use my rebar3
# alias rebar3 /Users/spoulsen/.cache/rebar3/bin/rebar3

set -xg TZ "America/New_York"

# nix
# NOTE this doesn't work and I'm not sure how to correctly configure nix with fish as of now
#source /Users/spoulsen/.nix-profile/etc/fish/config.fish

# Enable gpg auth for ssh
set -x GPG_TTY (tty)
set -xg SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Source asdf version manager
source ~/.asdf/asdf.fish
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
