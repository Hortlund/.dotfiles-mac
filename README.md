# Guide to set up bare repository for tracking dotfiles
https://www.atlassian.com/git/tutorials/dotfiles

## Steps for setting up first time
```bash
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```
* The first line creates a folder ~/.dotfiles which is a Git bare repository that will track our files.

* Then we create an alias config which we will use instead of the regular git when we want to interact with our configuration repository.

* We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type config status and other commands later, files you are not interested in tracking will not show up as untracked.

* Also you can add the alias definition by hand to your .zshrc or use the the fourth line provided for convenience.

After you've executed the setup any file within the $HOME folder can be versioned with normal commands, replacing git with your newly created config alias, like:

```bash
config status
config add .zshrc
config commit -m "Add zshrc"
config push
```
