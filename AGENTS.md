# AGENTS

Developer dotfiles for macOS and Linux, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Cloned to `~/dotfiles` and symlinked into `$HOME` via `stow <package>`.

## Repository structure

Each top-level directory is a Stow **package**. Its contents are symlinked into `$HOME`,
preserving the subdirectory hierarchy:

```
dotfiles/
  zsh/
    .zshrc             → ~/.zshrc
    .aliases           → ~/.aliases
    .functions         → ~/.functions
    .zprofile          → ~/.zprofile
    .homebrew          → ~/.homebrew
  nvim/
    .config/nvim/      → ~/.config/nvim/
  homebrew/
    .Brewfile          → ~/.Brewfile
    .Brewfile.work     → ~/.Brewfile.work
  mise/
    .config/mise/
      config.toml       → shared mise settings
      config.linux.toml → Linux-only tool manifest
      miserc.toml       → enables platform config discovery
  bin/                 ← not a Stow package; added directly to $PATH
  install.sh           ← post-stow setup (MAS apps, Lua tools, Cargo binaries)
  mac-preferences.sh   ← macOS system defaults
```

## Key files

| File | Purpose |
|------|---------|
| `zsh/.zshrc` | Main Zsh config — PATH, Oh My Zsh plugins, prompt, tool initialization |
| `zsh/.aliases` | Simple command aliases (Rails shortcuts, editor shortcuts) |
| `zsh/.functions` | Shell functions (`tm`, `bb`, `mu`, `timezsh`) |
| `zsh/.zprofile` | Initializes Homebrew paths on macOS login shells |
| `gitui/.config/gitui/key_bindings.ron` | GitUI's official Vim-style keybindings |
| `homebrew/.Brewfile` | Global Homebrew bundle installed on every machine |
| `homebrew/.Brewfile.work` | Work-specific packages; symlink to `~/.Brewfile.local` to activate |
| `mise/.config/mise/config.toml` | Shared mise settings and language runtimes |
| `mise/.config/mise/config.linux.toml` | Linux-only user-level CLI tools |
| `bin/bootstrap-linux` | Bootstraps the user environment on an Ansible-provisioned Linux machine |
| `bin/claude-statusline` | Claude Code status line; `~/.claude/settings.json` stays unversioned and points to it |
| `bin/setup-claude` | Sets `statusLine` in `~/.claude/settings.json`; run by `bootstrap-linux` and `install.sh` |
| `bin/clean-rails-projects` | Frees disk space from Rails project directories (logs, compiled assets) |
| `install.sh` | Post-Stow setup: MAS apps, `luarocks install`, `cargo install` |
| `mac-preferences.sh` | macOS `defaults write` preferences |

## Adding a new Stow package

1. Create `dotfiles/<tool>/` and mirror the target path inside it.
   Example for a tool that reads `~/.config/<tool>/config.toml`:
   ```
   dotfiles/<tool>/.config/<tool>/config.toml
   ```
2. Run `cd ~/dotfiles && stow <tool>`.
3. Add the package name to the `stow` command block in `README.md`.

## Adding Homebrew packages

- All machines → append to `homebrew/.Brewfile`
- Work machines only → append to `homebrew/.Brewfile.work`

Run `bb` to install (it bundles both the global Brewfile and `~/.Brewfile.local` if present).

## Shell code conventions

| Type | Where |
|------|-------|
| Single-line aliases | `zsh/.aliases` |
| Shell functions | `zsh/.functions` (sourced by `.zshrc`) |
| Standalone utility scripts | `bin/` (executable bash scripts) |

`bin/` is not a Stow package. `$HOME/dotfiles/bin` is added to `$PATH` directly in `.zshrc`,
so scripts there are available on every machine after cloning.

## Extending `bin/clean-rails-projects`

Add entries to `TRUNCATE_DIRS` (zero out matching files, keeping them) or `REMOVE_DIRS`
(delete the directory entirely) at the top of the script — no logic changes required:

```bash
TRUNCATE_DIRS=("log")
REMOVE_DIRS=("public/packs" "public/packs-test" "tmp/cache")
```

## Machine-specific config

`~/.Brewfile.local` is gitignored. To activate a profile on a machine:
```sh
ln -s ~/.Brewfile.work ~/.Brewfile.local
```

## Runtime version management

Ruby, Node.js, Go, Rust, and Bun are managed by [mise](https://mise.jdx.dev) on
both macOS and Linux. On macOS, Homebrew owns the other global CLI tools; on Linux,
mise owns the user-level CLI tools in `config.linux.toml`. mise also reads
project-local `.ruby-version`, `.nvmrc`, and `.node-version` files. Install
configured versions with `mise install`.

## Platform support

- Keep shared configuration portable between macOS and Linux.
- Put Linux-only mise tools in `mise/.config/mise/config.linux.toml`.
- Keep Homebrew packages and macOS applications in `homebrew/.Brewfile`.
- The Linux setup intentionally Stows only the packages listed in the README.

## No build step

There is no CI, test suite, or compilation. Changes take effect after re-sourcing
the shell (`source ~/.zshrc`, or the `so` alias) or opening a new terminal.
Shell script syntax can be checked with `bash -n <script>`.
