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
* ~~qutebrowser - GUI Browser~~
* Firefox - GUI Browser
* neovim - text editor
* Weechat - IRC Client
* sxhkd - Keybinding
* Fucking Fast File Manager
* ~~RTV - Reddit Terminal View -TUI~~ (Note: use tuir which is fork version or RTV. only if API no longer works)


