# dotfile management with GNU stow and git

After cloning the repo, run:
```sh
$ cd ~/dotfiles
git submodule init
git submodule update
$ stow zsh
$ stow vim
$ stow bash
```

to symlink the dotfiles to their appropriate locations.

## Dirs

### Git
Configuring personal access tokens and https access to GitHub:

1. Make [.netrc](https://www.gnu.org/software/inetutils/manual/html_node/The-_002enetrc-file.html) file at `~/.netrc`

  ```txt
  machine github.com
  login $GITHUB_USERNAME
  password $GITHUB_PERSONAL_ACCESS_TOKEN
  protocol https
  ```
2. Encrypt `~/.netrc`:
  ```sh
  gpg -e -r $YOUR_GPG_KEY ~/.netrc
  ```
  Should now have `~/.netrc.gpg`.


3. Confirm that `~/.netrc.gpg` exists and delete `~/.netrc`.

4. Add Git.pm to the Perl path (intstall updated Perl if necessary).
  ```fish
  set -Ux PERL5LIB /usr/local/share/perl5
  ```

5. Tell git to use the netrc file when doing stuff:
  ```sh
  git config --global credential.helper "netrc -f ~/.netrc.gpg -v"
  ```

6. Clone/fetch/pull from an https remote and you should get a GPG prompt to decrypt the credentials.
