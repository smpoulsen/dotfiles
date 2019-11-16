# Travis Poulsen
# 2019

## Useful commands:

# Add something to $fish_user_paths:
# set fish_user_paths /Users/tpoulsen/.nix-profile/bin $fish_user_paths

# Add something permanently to $fish_user_paths:
# set -U fish_user_paths /Users/tpoulsen/.nix-profile/bin $fish_user_paths

# Remove something from $fish_user_paths (fish_user_paths is a 1-indexed list):
# set --erase fish_user_paths[index]

# Remove something permanently from $fish_user_paths:
# set --erase -U fish_user_paths[index]


## BEGIN CONFIG

# Add nix installed items to $PATH
#set fish_user_paths /Users/tpoulsen/.nix-profile/bin $fish_user_paths
# Add brew installed items to $PATH
#set fish_user_paths /usr/local/sbin/ $fish_user_paths

# Pure theme configuration
# REF: https://github.com/rafaelrinaldi/pure#configuration
set pure_symbol_prompt λ

# Erlang shell history
set -gx ERL_AFLAGS "-kernel shell_history enabled"
# Use my rebar3
alias rebar3 /Users/tpoulsen/.cache/rebar3/bin/rebar3

# Work proxy junk
set http_proxy "http://185.46.212.97:9480/"
set https_proxy "http://185.46.212.97:9480/"
set HTTP_PROXY "http://185.46.212.97:9480/"
set HTTPS_PROXY "http://185.46.212.97:9480/"
set no_proxy '.lan.philips.com'
set NO_PROXY '.lan.philips.com'

# nix
# NOTE this doesn't work and I'm not sure how to correctly configure nix with fish as of now
#source /Users/tpoulsen/.nix-profile/etc/fish/config.fish

# Source asdf version manager
source ~/.asdf/asdf.fish
