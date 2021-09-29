function _halostatue_fish_kerl_uninstall -e halostatue_fish_kerl_uninstall
    functions -e (functions -a | string match -e -r _halostatue_fish_kerl_)
end

function _halostatue_fish_kerl_base_dir
    set -l base $KERL_BASE_DIR

    if test -z $KERL_BASE_DIR
        set -l config $KERL_CONFIG

        test -z $KERL_CONFIG
        and set config $HOME/.kerlrc

        test -f $config
        and set base (string match -e KERL_BASE_DIR= < $config | string replace -r '^.*?=' '')

        if not test -z $base
            if functions -q replay
                set base (replay "echo "$base)
            else if functions -q bass
                set base (bass "echo "$base)
            else if functions -q bax
                set base (bax "echo "$base)
            else
                set base (eval (string replace -a -r '\$\{([^}]+)\}' '$$$1' $base))
            end
        end
    end

    test -z $base
    and set base $HOME/.kerl

    echo $base
end

function _halostatue_fish_kerl_available_releases
    cat (_halostatue_fish_kerl_base_dir)/otp_releases
end

function _halostatue_fish_kerl_builds
    kerl list builds 2>/dev/null | cut -f2 -d','
end

function _halostatue_fish_kerl_installations
    kerl list installations 2>/dev/null | cut -f 2 -d " "
end

function _halostatue_fish_kerl_installnames
    kerl list installations 2>/dev/null | cut -f 2 -d " " | xargs -n 1 basename
end

function _halostatue_fish_kerl_print_containers --description 'Print a list of kerl containers' -a select
    set -l filter -- --all
    switch $select
        case running
            set filter --filter status=running
        case stopped
            set filter --filter status=exited
    end

    kerl ps --no-trunc $filter --format '{{.ID}}\n{{.Names}}' | tr ',' '\n'
end

function _halostatue_fish_kerl_print_images --description 'Print a list of kerl images'
    kerl images --format '{{if eq .Repository "<none>"}}{{.ID}}\tUnnamed Image{{else}}{{.Repository}}:{{.Tag}}{{end}}'
end

function _halostatue_fish_kerl_print_repositories --description 'Print a list of kerl repositories'
    kerl images --format '{{.Repository}}' | command grep -v '<none>' | command sort | command uniq
end

function _halostatue_fish_kerl_print_compose_services --description 'Print a list of kerl-compose services'
    kerl-compose config --services 2>/dev/null | command sort
end

function _halostatue_fish_kerl_no_subcommand
    for i in (commandline -opc)
        if contains -- $i build install deploy update list delete install-docsh path active plt status prompt cleanup version activate
            return 1
        end
    end
    return 0
end

function _halostatue_fish_kerl_pos
    set -l cmd (commandline -opc)
    test (count $cmd) -eq $argv[1]
end

function _halostatue_fish_kerl_seen_subcommand_chain
    set -l cmd (commandline -poc)
    set -e cmd[1]
    set -l argc (count $argv)

    test $argc -ne 0
    and test (count $cmd) -ne 0
    and test (string join ';' $argv) = (string join ';' $cmd[1..$argc])
end
