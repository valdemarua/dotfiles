# Homebrew
# brew shellenv sets HOMEBREW_PREFIX, HOMEBREW_CELLAR, HOMEBREW_REPOSITORY, etc.

# Only run in interactive shells to avoid issues with CLI tools
if [[ -o interactive ]]; then
    # Apple Silicon
    [ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
    # Intel
    [ -f "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
fi

export HOMEBREW_CASK_OPTS="--fontdir=/Library/Fonts"

# Keg-only formulae (not symlinked into Homebrew prefix by default)
export PATH="${HOMEBREW_PREFIX}/opt/imagemagick@6/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/mysql@5.7/bin:$PATH"
export PATH="${HOMEBREW_PREFIX}/opt/postgresql@16/bin:$PATH"
