if [[ "$OSTYPE" == darwin* && -o interactive ]]; then
  # Homebrew environment: the same result as `eval "$(brew shellenv)"`, written
  # out because running brew takes ~35ms on every new shell. If Homebrew ever
  # changes what `brew shellenv` prints, compare and update these lines.
  if [[ -x /opt/homebrew/bin/brew ]]; then      # Apple Silicon
    export HOMEBREW_PREFIX=/opt/homebrew HOMEBREW_REPOSITORY=/opt/homebrew
  elif [[ -x /usr/local/bin/brew ]]; then       # Intel
    export HOMEBREW_PREFIX=/usr/local HOMEBREW_REPOSITORY=/usr/local/Homebrew
  fi

  if [[ -n "${HOMEBREW_PREFIX:-}" ]]; then
    export HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
    export PATH="${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:${PATH}"
    export INFOPATH="${HOMEBREW_PREFIX}/share/info:${INFOPATH:-}"
    fpath=("${HOMEBREW_PREFIX}/share/zsh/site-functions" $fpath) # completions

    # Keg-only formulae are not symlinked into the Homebrew prefix by default.
    export PATH="${HOMEBREW_PREFIX}/opt/imagemagick@6/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/mysql-client@8.4/bin:${PATH}"
    export PATH="${HOMEBREW_PREFIX}/opt/postgresql@16/bin:${PATH}"
  fi

  export HOMEBREW_CASK_OPTS="--fontdir=/Library/Fonts"
fi
