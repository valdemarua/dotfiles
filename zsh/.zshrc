zmodload zsh/zprof # Profiler

zstyle ':omz:update' mode disabled
# This will check for updates every 14 days
zstyle ':omz:update' frequency 14

ZSH_DISABLE_COMPFIX=true

export EDITOR='vim'

if [[ "$OSTYPE" == darwin* ]]; then
  export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
  export LC_ALL=en_US.UTF-8
fi

export TMUX_SESSION_NAME="humanize"

alias th="tmux new -s $TMUX_SESSION_NAME"

if [[ -n "${HOMEBREW_PREFIX:-}" && -d "${HOMEBREW_PREFIX}/opt/ruby/bin" ]]; then
  export PATH="${HOMEBREW_PREFIX}/opt/ruby/bin:${PATH}"
fi

export PATH="${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/dotfiles/bin:${PATH}"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Activate mise before tools provided by the Linux-only manifest are initialized.
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# FZF
export FZF_DEFAULT_COMMAND='fd --type f'
# Set up fzf key bindings and fuzzy completion
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# zsh keybindings
#
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# zsh options
#
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="cobalt2"
# ZSH_THEME="random"

# ZSH_THEME="muse" # set by `omz`

# Initialize Pure theme
# https://github.com/sindresorhus/pure#getting-started
# autoload -U promptinit; promptinit
# prompt pure

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git ruby bundler)

if [[ "$OSTYPE" == darwin* ]]; then
  plugins+=(macos)
fi

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"

if [[ -r "${ZSH}/oh-my-zsh.sh" ]]; then
  source "${ZSH}/oh-my-zsh.sh"
fi

if [[ -r "${HOME}/.aliases" ]]; then
  source "${HOME}/.aliases"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Init zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Python
export PATH="${HOME}/.pyenv/shims:${PATH}"

# Go
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${PATH}"

#
# Functions
#
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Init starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
