# Travis Poulsen - 2016
export PATH="$HOME/Library/Haskell/bin:$HOME/.cabal/bin:$HOME/.nix-profile/.bin:$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/Developer:$HOME/node_modules/.bin:$HOME/node_modules/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Nix
. /Users/tpoulsen/.nix-profile/etc/profile.d/nix.sh

# NPM
NPM_PACKAGES="${HOME}/node_modules"

export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
