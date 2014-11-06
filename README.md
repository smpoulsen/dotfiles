dotfile management with GNU Stow and git.

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
