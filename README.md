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
  amethyst \
  gem \
  git \
  ghostty \
  helix \
  homebrew \
  kitty \
  mise \
  nvim \
  pry \
  term \
  tmux \
  vim \
  wezterm \
  zellij \
  zsh \
  starship \
  lua
```

##### Install packages
```
brew bundle --global
```

For machine-specific packages, profile Brewfiles are versioned in `homebrew/`:

- `homebrew/.Brewfile.work` — work-only tools

After stowing, symlink the relevant profile to activate it:
```
ln -s ~/.Brewfile.work ~/.Brewfile.local
```

The `bb` alias will automatically detect `~/.Brewfile.local` and install it on top of the main Brewfile. The symlink itself is gitignored — only the profile file is versioned.

#### Next steps
##### Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

##### Install terminfo file
```
tic -x ~/.xterm-256color-italic.terminfo
```
##### Node.js / Ruby / Go / Bun

Tool versions are managed by [mise](https://mise.jdx.dev). It reads `.ruby-version`, `.nvmrc`, and `.node-version` files automatically.

To install the versions specified in the current project:
```
mise install
```

To install a specific tool and version:
```
mise use --global node@lts
mise use --global ruby@3.3
```

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
