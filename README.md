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
  ssh \
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

The `bb` function upgrades everything in the main Brewfile, automatically detects
`~/.Brewfile.local` and upgrades that profile too, then removes all cached Homebrew
downloads. The symlink itself is gitignored — only the profile file is versioned.

#### Next steps
##### Install [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

### Aliases (`zsh/.aliases`)

| Alias | Expands to | Description |
|-------|------------|-------------|
| **Shell** | | |
| `so` | `source ~/.zshrc` | Reload shell config |
| `cl` | `clear` | Clear terminal |
| **Navigation** | | |
| `cds` | `cd ~/Sites` | Jump to Sites |
| `cdp` | `cd ~/Projects` | Jump to Projects |
| `cdb` | `cd ~/Dropbox` | Jump to Dropbox |
| `cdv` | `cd ~/Dropbox/vagrant` | Jump to Vagrant dir |
| `cdd` | `cd ~/Downloads` | Jump to Downloads |
| `dtf` | `cd ~/dotfiles` | Jump to dotfiles |
| **Homebrew** | | |
| `bb` | `brew bundle ...` | Upgrade `~/.Brewfile` + `~/.Brewfile.local` if present, then purge Homebrew's download cache |
| **Rails** | | |
| `rs` | `rails s` | Start Rails server |
| `rc` | `rails c` | Open Rails console |
| `rdm` | `rails db:migrate` | Run migrations |
| `rdms` | `rails db:migrate:status` | Show migration status |
| `rdr` | `rails db:rollback` | Rollback last migration |
| `rT` | `rails -T` | List Rake tasks |
| `ra` | `rubocop -a` | Run Rubocop with auto-correct |
| `bs` | `bin/setup` | Run project setup script |
| `bw` | `bin/webpack-dev-server` | Start Webpack dev server |
| `ss` | `spring stop` | Stop Spring preloader |
| **Capistrano** | | |
| `capp` | `bundle exec cap production deploy` | Deploy to production |
| `caps` | `bundle exec cap staging deploy` | Deploy to staging |
| `capv` | `bundle exec cap vagrant deploy` | Deploy to Vagrant |
| `cappdp` | `bundle exec cap production db:pull` | Pull production DB |
| **Overmind** | | |
| `os` | `overmind start` | Start all Procfile processes |
| `osd` | `overmind s -f Procfile.dev` | Start dev Procfile processes |
| **npm** | | |
| `nrd` | `npm run dev` | Run dev script |
| `nrl` | `npm run lint` | Run lint script |
| **Editors** | | |
| `v` / `vv` | `vim` / `vim .` | Open Vim |
| `n` / `nv` / `nn` / `nvv` | `nvim` / `nvim .` | Open Neovim |
| `vrc` / `vimrc` | `vim ~/.vimrc` | Edit Vim config |
| `zrc` / `zshrc` | `vim ~/.zshrc` | Edit Zsh config |
| **Tools** | | |
| `t` | `tree` | Directory tree |
| `lg` | `lazygit` | Open Lazygit |
| `hg` | `history \| grep` | Search shell history |

### Scripts (`bin/`)

`~/dotfiles/bin` is on `$PATH` automatically after stowing `zsh`. No additional setup needed.

| Script | Usage | Description |
|--------|-------|-------------|
| `clean-rails-projects` | `clean-rails-projects [--dry-run] [DIR]` | Frees disk space in Rails project subdirectories. Truncates log files (`log/*.log`, `log/*.log.*`) and removes `public/packs`, `public/packs-test`, `tmp/cache`, and `tmp/screenshots`. Defaults to the current directory. Use `--dry-run` / `-n` to preview without making changes. |
