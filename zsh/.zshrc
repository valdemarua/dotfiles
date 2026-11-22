# Startup profiler, loaded only on request: run `ZPROF=1 zsh -i`, then `zprof`
# to list the slowest functions. (Loaded always, it times every function call.)
[[ -n $ZPROF ]] && zmodload zsh/zprof

# Keep only the first occurrence of each directory in PATH and fpath, so
# re-adding one (nested shells, tmux, `source ~/.zshrc`) doesn't duplicate it.
# Both spellings are listed: `path` is the array form of the PATH string, and
# zsh only dedupes `export PATH="..."` assignments when PATH is marked too.
typeset -U PATH path FPATH fpath

export EDITOR='vim'

if [[ "$OSTYPE" == darwin* ]]; then
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
  export LC_ALL=en_US.UTF-8
fi

export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/dotfiles/bin:${PATH}"

# History
#
# HISTSIZE is how many commands the current shell keeps in memory; SAVEHIST is
# how many are written to HISTFILE. Without them zsh may not save history to a
# file at all (macOS sets small defaults in /etc/zshrc; Linux often sets none).
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt sharehistory      # write each command immediately; other shells see it
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion
#
# compinit enables Tab completion. It must run before the tools below, because
# some of them (zoxide, gcloud) register completions with `compdef`, which
# compinit defines. gcloud even runs compinit itself if it's missing, with the
# interactive "insecure directories" prompt.
#
# -u trusts completion directories owned by another user. On macOS Homebrew's
# directories belong to whichever account installed Homebrew, so without -u
# every other account on the Mac gets that prompt on each new shell.
#
# compinit caches what it finds in ~/.zcompdump. Checking that cache is half of
# its cost, so it's only checked (no -C) when a completion directory changed
# since the cache was written, e.g. after installing a tool. Otherwise -C
# loads the cache as is.
autoload -Uz compinit
_zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
_zcomp_check=-C
for _dir in $fpath; do
  [[ $_dir -nt $_zcompdump ]] && { _zcomp_check=; break; }
done
[[ -s $_zcompdump ]] || _zcomp_check=
compinit -u $_zcomp_check -d $_zcompdump
# compinit leaves the file untouched when nothing changed; touch it so the
# check above doesn't keep seeing a changed directory.
[[ -z $_zcomp_check ]] && touch $_zcompdump
unset _zcompdump _zcomp_check _dir
zstyle ':completion:*' menu select                 # arrow keys to pick a match
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case-insensitive matching

# Key bindings
#
# Emacs-style editing (Ctrl-A/Ctrl-E, Alt-B/Alt-F, Ctrl-W...). Without this
# zsh switches to vi mode because EDITOR contains "vi".
bindkey -e

# Up/Down and Ctrl-P/Ctrl-N search history for commands starting with the text
# already typed (plain Up/Down on an empty line).
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search   # Up
bindkey '^[OA' up-line-or-beginning-search   # Up (application mode)
bindkey '^[[B' down-line-or-beginning-search # Down
bindkey '^[OB' down-line-or-beginning-search # Down (application mode)
bindkey '^p' up-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search

bindkey '^[[H' beginning-of-line     # Home
bindkey '^[[F' end-of-line           # End
bindkey '^[[3~' delete-char          # Delete
bindkey '^[[Z' reverse-menu-complete # Shift-Tab: previous completion

# Tools
#
# Each one is skipped if it isn't installed, so the same file works on macOS
# (Homebrew) and Linux (mise).
#
# _cached_init <name> <command...> sources what the command prints, e.g. a
# tool's `init zsh` script. The output is saved in ~/.cache/zsh/<name>.zsh and
# reused, so the tool doesn't run on every new shell. The cache is rebuilt when
# the tool's executable changes (upgrade, reinstall); `rm -r ~/.cache/zsh`
# forces a rebuild. Only use it for output that doesn't depend on the current
# directory or environment.
_cached_init() {
  local name=$1 exe=${2:c:A} first   # :c finds the command in PATH, :A resolves symlinks
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/${name}.zsh"
  [[ -x $exe ]] || return 1
  [[ -r $cache ]] && read -r first < $cache
  # First line records which executable produced the cache.
  if [[ $first != "# $exe" || $exe -nt $cache ]]; then
    mkdir -p "${cache:h}"
    { print -r -- "# $exe"; "${@:2}" } >| "$cache" || { rm -f "$cache"; return 1; }
  fi
  source "$cache"
}

# Not cached: mise's output includes the current PATH and project settings.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

export FZF_DEFAULT_COMMAND='fd --type f'
_cached_init fzf fzf --zsh
_cached_init zoxide zoxide init zsh

# Binaries installed with `go install`; Go defaults GOPATH to ${HOME}/go.
export PATH="${PATH}:${HOME}/go/bin"

# --print-full-init: `starship init zsh` alone prints a stub that runs starship
# a second time to get this.
_cached_init starship starship init zsh --print-full-init

# Google Cloud SDK (Homebrew)
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# Aliases and functions; loaded last so they override anything set above.
[[ -r "${HOME}/.aliases" ]] && source "${HOME}/.aliases"
[[ -r "${HOME}/.functions" ]] && source "${HOME}/.functions"
