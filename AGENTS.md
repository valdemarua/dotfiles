# AGENTS

Developer dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Cloned to `~/dotfiles` and symlinked into `$HOME` via `stow <package>`.

## Repository structure

Each top-level directory is a Stow **package**. Its contents are symlinked into `$HOME`,
preserving the subdirectory hierarchy:

```
dotfiles/
  zsh/
    .zshrc             → ~/.zshrc
    .aliases           → ~/.aliases
    .zprofile          → ~/.zprofile
    .homebrew          → ~/.homebrew
  nvim/
    .config/nvim/      → ~/.config/nvim/
  homebrew/
    .Brewfile          → ~/.Brewfile
    .Brewfile.work     → ~/.Brewfile.work
  bin/                 ← not a Stow package; added directly to $PATH
  install.sh           ← post-stow setup (MAS apps, Lua tools, Cargo binaries)
  mac-preferences.sh   ← macOS system defaults
```

## Key files

| File | Purpose |
|------|---------|
| `zsh/.zshrc` | Main Zsh config — PATH, Oh My Zsh plugins, prompt, tool initialization |
| `zsh/.aliases` | Aliases and shell functions (`bb`, Rails shortcuts, editor shortcuts) |
| `zsh/.zprofile` | Sources `~/.homebrew` (sets up Homebrew environment at login) |
| `homebrew/.Brewfile` | Global Homebrew bundle installed on every machine |
| `homebrew/.Brewfile.work` | Work-specific packages; symlink to `~/.Brewfile.local` to activate |
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
| Multi-line shell functions | `zsh/.aliases` (see `bb()` as a model) |
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

Ruby, Node.js, Go, and Bun versions are managed by [mise](https://mise.jdx.dev).
It reads `.ruby-version`, `.nvmrc`, and `.node-version` in project directories automatically.
Install versions for the current project with `mise install`.

## No build step

There is no CI, test suite, or compilation. Changes take effect after re-sourcing
the shell (`source ~/.zshrc`, or the `so` alias) or opening a new terminal.
Shell script syntax can be checked with `bash -n <script>`.
