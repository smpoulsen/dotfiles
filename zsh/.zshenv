# Travis Poulsen - 2016
export PATH="$HOME/Library/Haskell/bin:$HOME/.cabal/bin:$HOME/.cargo/bin:$HOME/.nix-profile/.bin:$HOME/.local/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/Developer:$HOME/node_modules/.bin:$HOME/node_modules/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Nix
# Not currently using.
# . /Users/tpoulsen/.nix-profile/etc/profile.d/nix.sh

# asdf PL version manager
. $HOME/.asdf/asdf.sh

# NPM
NPM_PACKAGES="${HOME}/node_modules"

# Enable erlang-history
export ERL_AFLAGS="-kernel shell_history enabled"

# Rust stuff
export RUST_SRC_PATH="${HOME}/.rust/rust"
if [ -e /Users/sylvie/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/sylvie/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
