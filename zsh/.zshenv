# Travis Poulsen - 2016
export PATH="$HOME/Library/Haskell/bin:$HOME/.cabal/bin:$HOME/.nix-profile/.bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/Developer:$HOME/node_modules/.bin:$HOME/node_modules/bin"
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

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
