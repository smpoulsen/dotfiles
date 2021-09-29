complete --command kerl --erase

complete --command kerl --description 'Build and install Erlang/OTP' --no-files

# build
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments build --description 'Build specified release or git repository' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain build; and _halostatue_fish_kerl_pos 2' --arguments '(_halostatue_fish_kerl_available_releases)' --description Release --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain build; and _halostatue_fish_kerl_pos 3' --arguments '(_halostatue_fish_kerl_available_releases)' --description 'Build Name' --no-files

# install
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments install --description 'Install the specified release at the given location' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain install; and _halostatue_fish_kerl_pos 2' --arguments '(_halostatue_fish_kerl_builds)' --description Build --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain install; and _halostatue_fish_kerl_pos 3' --arguments '(__fish_complete_directories)' --description 'Install Path' --no-files

# deploy
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments deploy --description 'Deploy the specified installation to the given host and location' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain deploy; and _halostatue_fish_kerl_pos 2' --arguments '(__fish_complete_user_at_hosts)' --description Target --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain deploy; and _halostatue_fish_kerl_pos 3' --arguments '(_halostatue_fish_kerl_installations)' --description Installation --no-files

# update
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments update --description 'Update the list of available releases from your source provider' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain update; and _halostatue_fish_kerl_pos 2' --arguments releases --no-files

# list
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments list --description 'List releases, builds, or installations' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain list; and _halostatue_fish_kerl_pos 2' --arguments releases --description 'List releases' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain list; and _halostatue_fish_kerl_pos 2' --arguments builds --description 'List builds' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain list; and _halostatue_fish_kerl_pos 2' --arguments installations --description 'List installations' --no-files

# delete
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments delete --description 'Delete builds and installations' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain delete; and _halostatue_fish_kerl_pos 2' --arguments build --description 'Delete a build' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain delete build; and _halostatue_fish_kerl_pos 3' --arguments '(_halostatue_fish_kerl_builds)' --description Build --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain delete; and _halostatue_fish_kerl_pos 2' --arguments installation --description 'Delete an installation' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain delete installation; and _halostatue_fish_kerl_pos 3' --arguments '(_halostatue_fish_kerl_installations)' --description Installation --no-files

# install-docsh
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments install-docsh --description 'Install erl shell documentation access extension - docsh' --no-files

# path
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments path --description 'Print the path of a given installation' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain path; and _halostatue_fish_kerl_pos 2' --arguments '(_halostatue_fish_kerl_installnames)' --description Installation --no-files

# active
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments active --description 'Print the path of the active installation' --no-files

# plt
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments plt --description 'Print Dialyzer PLT path for the active installation' --no-files

# status
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments status --description 'Print available builds and installations' --no-files

# prompt
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments prompt --description 'Print a string suitable for insertion in prompt' --no-files

# cleanup
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments cleanup --description 'Remove compilation artifacts (use after installation)' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain cleanup; and _halostatue_fish_kerl_pos 2' --arguments all --description 'All builds' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain cleanup; and _halostatue_fish_kerl_pos 2' --arguments '(_halostatue_fish_kerl_builds)' --description Build --no-files

# version
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments version --description 'Print current version' --no-files

# activate
complete --command kerl --condition _halostatue_fish_kerl_no_subcommand --arguments activate --description 'Activate an installation' --no-files
complete --command kerl --condition '_halostatue_fish_kerl_seen_subcommand_chain activate; and _halostatue_fish_kerl_pos 2' --arguments '(_halostatue_fish_kerl_installnames)' --description Build --no-files
