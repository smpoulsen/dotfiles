export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
export PATH="$HOME/.cargo/bin:$PATH"
