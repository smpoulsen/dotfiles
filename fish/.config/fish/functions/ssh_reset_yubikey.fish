# Defined interactively
function ssh_reset_yubikey
gpg-connect-agent "scd serialno" "learn --force" /bye
end
