export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
export PATH="$HOME/.cargo/bin:$PATH"
PATH=EBAR_BIN:ATH
if [ -e /Users/sylvie/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/sylvie/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
