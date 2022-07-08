### Installation
_________

#### On fresh Mac OS
##### Install XCode Command Line Tools
```
xcode-select --install
```

##### Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Don't forget to add Homebrew to your PATH. See instructions in installation log.

##### Install Stow
```
brew install stow
```

##### Clone dotfiles
```
git clone https://github.com/valdemarua/dotfiles.git ~/dotfiles
```

##### Link config files with Stow
```
cd ~/dotfiles && stow \
  alacritty \
  kitty \
  amethyst \
  git \
  gem \
  homebrew \
  zsh \
  term \
  vim \
  nvim \
  tmux \
  pry
```

##### Install packages
```
brew bundle --global
```

#### Next steps
##### Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##### Install terminfo file
```
tic -x ~/.xterm-256color-italic.terminfo
```
##### Node.js

To download, compile, and install the latest release of node, do this:
```
nvm install node # "node" is an alias for the latest version
```

To install a specific version of node:
```
nvm install 14.7.0 # or 16.3.0, 12.22.1, etc
```

If `nvm` not found see post-install instructions from homebrew how to set `NVM_DIR` correctly: `brew info nvm`.

##### VIM

Install [vim-plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
**Important** some plugins depends on Node.js so it should be installed before you call the next command.

Call `:PlugInstall` in VIM to install plugins.

##### TMUX

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
