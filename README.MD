## Install
```
sudo pacman -S stow
```
* backup exisiting config
```
mkdir -p dotfilesbackup
mv .bashrc .bash_profile ~/dotfilesbackup
```
* setup git dir & fork.
```
mkdir -p ~/gitlab
git clone https://github.com/archfate/dotfiles.git ~/gitlab/ 
cd ~/gitlab
```
* symlink with stow
```
stow -vt ~ dotfiles
```

## Applications
* DWM - Suckless tiling Window  manager
* st - Suckless Simple Terminal
* newsboat - rss feed reader
* Tmux - terminal multiplexer
* ~~i3gaps - Window Manager~~
* ~~i3blocks - status bar~~
* w3m - commandline browser
* qutebrowser - GUI Browser
* neovim - text editor

