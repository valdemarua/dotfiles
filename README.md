## Installation

### macOS

#### Install Xcode Command Line Tools
```
xcode-select --install
```

#### Install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Don't forget to add Homebrew to your PATH. See instructions in installation log.

#### Install Stow
```
brew install stow
```

#### Clone dotfiles
```
git clone https://github.com/valdemarua/dotfiles.git ~/dotfiles
```

#### Link config files with Stow
```
cd ~/dotfiles && stow \
  alacritty \
  amethyst \
  gem \
  git \
  gitui \
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

#### Install packages
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

### Ubuntu/Linux

The server provisioning playbook owns operating-system packages and services. The
dotfiles bootstrap script installs the user environment. Homebrew is not installed
on Linux.

The following system tools must already be available (normally installed by Ansible):
`curl`, `git`, `stow`, `zsh`, and the native libraries required by language runtimes.

#### Clone dotfiles

```sh
git clone https://github.com/valdemarua/dotfiles.git ~/dotfiles
```

If zsh displays its new-user setup wizard when you log in, press `q`. Do not let it
create `.zshrc`; that file is managed by this repository.

#### Bootstrap the user environment

Run the idempotent bootstrap script directly from the cloned repository:

```sh
~/dotfiles/bin/bootstrap-linux
```

The script:

- Stows only the headless Linux packages: `git`, `gitui`, `mise`, `nvim`, `starship`, `tmux`, and `zsh`.
- Installs the official user-scoped mise binary when it is missing.
- Installs Oh My Zsh without replacing the managed `.zshrc`.
- Installs the configured language runtimes and Linux CLI applications.

Start the configured shell when it finishes:

```sh
exec zsh
```

The shared mise config installs language runtimes on both macOS and Linux.
`mise/.config/mise/config.linux.toml` additionally installs command-line development
tools and coding agents on Linux that Homebrew owns on macOS. Verify the selected
files and tools with:

```sh
mise config ls
mise ls --current
mise doctor
```

To update mise and all Linux user-level tools together:

```sh
mu
```

On Linux, Claude Code, Codex, and OpenCode are exempt from mise's release-age
delay. Other tools and mise itself retain their default release-age policy.

GitUI is installed through Homebrew on macOS and mise on Linux; run `gitui`
inside a Git repository to try it.
The `gitui` Stow package installs the [official Vim keybindings](https://github.com/gitui-org/gitui/blob/v0.28.1/vim_style_key_config.ron):
`h/j/k/l` navigation, `Ctrl-b`/`Ctrl-f` paging, `g`/`G` for top/bottom, and `F1` for help.

Hermes uses its own official installer and updater because it manages a dedicated
Python environment; it is not part of the mise manifest.

### Next steps

#### Node.js / Ruby / Go / Bun

Language runtimes are managed by [mise](https://mise.jdx.dev) on both platforms.
It reads `.ruby-version`, `.nvmrc`, and `.node-version` files automatically.
Global macOS CLI tools remain managed by Homebrew; the Linux CLI tool manifest is
`mise/.config/mise/config.linux.toml`.

To install the versions specified in the current project:
```
mise install
```

To select a version for the current project:
```
mise use node@lts
mise use ruby@3.3
```

#### VIM

Install [vim-plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
**Important** some plugins depends on Node.js so it should be installed before you call the next command.

Call `:PlugInstall` in VIM to install plugins.

#### TMUX

Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start tmux and press `C-s I` to install the configured plugins, including the
smart-splits backend.

Use `tm` to attach to or create the default `main` session. Pass a name when you
want a separate session, for example `tm work`. This is opt-in: `ssh dev1`
continues to open a normal shell, where you can run `tm` when wanted.

### Aliases and functions

Simple shortcuts live in `zsh/.aliases`; shell functions live in `zsh/.functions`.
Both are loaded by `.zshrc`. After pulling a change that adds a new Zsh file,
run `stow -R zsh` from the dotfiles directory, then `exec zsh` to reload.

| Alias | Expands to | Description |
|-------|------------|-------------|
| **Shell** | | |
| `so` | `source ~/.zshrc` | Reload shell config |
| `cl` | `clear` | Clear terminal |
| **Tmux** | | |
| `tm [session]` | `tmux new-session -A -s "${session:-main}"` | Attach to or create a session; defaults to `main` |
| `th` | `tm humanize` | Attach to or create the `humanize` session |
| **Navigation** | | |
| `cds` | `cd ~/Sites` | Jump to Sites |
| `cdp` | `cd ~/Projects` | Jump to Projects |
| `cdb` | `cd ~/Dropbox` | Jump to Dropbox |
| `cdv` | `cd ~/Dropbox/vagrant` | Jump to Vagrant dir |
| `cdd` | `cd ~/Downloads` | Jump to Downloads |
| `dtf` | `cd ~/dotfiles` | Jump to dotfiles |
| **Homebrew** | | |
| `bb` | `brew bundle ...` | On macOS, upgrade `~/.Brewfile` + `~/.Brewfile.local` if present, then purge Homebrew's download cache |
| **mise** | | |
| `mu` | `mise self-update && mise upgrade --global` | Update mise, then upgrade globally configured tools |
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
| `bootstrap-linux` | `~/dotfiles/bin/bootstrap-linux` | Idempotently links the headless Linux configuration and installs mise, Oh My Zsh, runtimes, and CLI tools. |
| `clean-rails-projects` | `clean-rails-projects [--dry-run] [DIR]` | Frees disk space in Rails project subdirectories. Truncates log files (`log/*.log`, `log/*.log.*`) and removes `public/packs`, `public/packs-test`, `tmp/cache`, and `tmp/screenshots`. Defaults to the current directory. Use `--dry-run` / `-n` to preview without making changes. |
