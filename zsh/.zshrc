zmodload zsh/zprof # Profiler

zstyle ':omz:update' mode disabled
# This will check for updates every 14 days
zstyle ':omz:update' frequency 14

ZSH_DISABLE_COMPFIX=true

export EDITOR='vim'

#export TERM="xterm-256color"
# Use this terminfo file to enable italic
export TERM="xterm-256color-italic"
# Use classic terminfo in ssh sessions
alias ssh="TERM=xterm-256color ssh"

export TMUX_SESSION_NAME="humanize"
export LC_ALL=en_US.UTF-8

alias th="tmux new -s $TMUX_SESSION_NAME"

# Use brew installed ruby as system ruby version
export PATH="/usr/local/opt/ruby/bin/:$PATH"
export PATH="${HOME}/.cargo/bin/:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/valdemarua/.oh-my-zsh

# FZF
export FZF_DEFAULT_COMMAND='fd --type f'

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

plugins=(git macos ruby rbenv vagrant bundler tmuxinator)

# User configuration

# Homebrew folder should be before /usr/bin
# This is the path to homebrew for Apple Silicon machines
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

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
eval "$(zoxide init zsh)"

# Init rbenv
eval "$(rbenv init -)"

export PATH="${HOMEBREW_PREFIX}/opt/imagemagick@6/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/mysql@5.7/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/imagemagick@6/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/postgresql@16/bin:$PATH"

# Python
export PATH="${HOME}/.pyenv/shims:${PATH}"

# Go
export GOPATH="${HOME}/go"
export PATH="${GOPATH}/bin:${PATH}"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# fnm
#
eval "$(fnm env --use-on-cd)"

#
# Functions
#
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Init starship prompt
eval "$(starship init zsh)"
