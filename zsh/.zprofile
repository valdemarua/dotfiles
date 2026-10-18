if [[ "$OSTYPE" == darwin* && -o interactive ]]; then
  # brew shellenv sets HOMEBREW_PREFIX, HOMEBREW_CELLAR,
  # HOMEBREW_REPOSITORY, and the Homebrew paths.
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  export HOMEBREW_CASK_OPTS="--fontdir=/Library/Fonts"

  if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
    # Keg-only formulae are not symlinked into the Homebrew prefix by default.
    export PATH="${HOMEBREW_PREFIX}/opt/imagemagick@6/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/mysql@5.7/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/postgresql@16/bin:${PATH}"
  fi
fi
