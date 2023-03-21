# container-dotfiles

A common set of zsh dotfiles for use inside docker containers. Currently used in a handful of personal projects.

## Usage
1. Copy files repo contents to ~/.dotfiles
2. Change to ~/.dotfiles
3. Rename `zshrc` to `.zshrc` and move to ~/.zshrc:
```shell
mv zshrc ~/.zshrc
```

Any subsequent logins will apply the new .zshrc settings.
