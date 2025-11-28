#
# brew shellenv sets the following env variables (values for x86 in the example):
#
# HOMEBREW_PREFIX=/usr/local
# HOMEBREW_CELLAR=/usr/local/Cellar
# HOMEBREW_REPOSITORY=/usr/local/Homebrew
# HOMEBREW_SHELLENV_PREFIX=/usr/local

# Only run in interactive shells to avoid issues with CLI tools
if [[ -o interactive ]]; then
    #
    # For Homebrew on Arm (Apple Silicon)
    #
    [ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
    #
    # For Homebrew on x86
    #
    [ -f "/usr/local/bin/brew" ] && eval "$(/usr/local/bin/brew shellenv)"
fi
