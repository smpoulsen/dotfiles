function kerl --description 'Build and install Erlang/OTP'
    if set -q argv[1]; and test $argv[1] = activate
        set -e argv[1]
        kerl_activate $argv
    else
        command kerl $argv
    end
end
