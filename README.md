### Install

#### On fresh Mac OS
#### Install XCode Command Line Tools
```
xcode-select --install
```

#### Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Install Stow
```
brew update && brew install stow
```

### Clone dotfiles
```
git clone https://github.com/valdemarua/dotfiles.git ~/dotfiles
```

### Link config files with Stow
```
stow homebrew zshrc
```

### Install packages
```
stow homebrew zshrc
```
