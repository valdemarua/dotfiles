zmodload zsh/zprof # Profiler; run `zprof` to see what slowed startup

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
autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select                 # arrow keys to pick a match
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # case-insensitive matching

# Key bindings: Ctrl-P / Ctrl-N search history for commands starting with the
# text already typed.
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Tools
#
# Each one is skipped if it isn't installed, so the same file works on macOS
# (Homebrew) and Linux (mise).
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

export FZF_DEFAULT_COMMAND='fd --type f'
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Binaries installed with `go install`; Go defaults GOPATH to ${HOME}/go.
export PATH="${PATH}:${HOME}/go/bin"

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Google Cloud SDK (Homebrew)
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# Aliases and functions; loaded last so they override anything set above.
[[ -r "${HOME}/.aliases" ]] && source "${HOME}/.aliases"
[[ -r "${HOME}/.functions" ]] && source "${HOME}/.functions"
