#!/usr/bin/env bash

# Close System Preferences
osascript -e 'tell application "System Preferences" to quit'

# Dock

# Hide Dock
defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock autohide-delay -float 0 && killall Dock
defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock

# Restore Dock
# defaults write com.apple.dock autohide -bool false && killall Dock
# defaults delete com.apple.dock autohide-delay && killall Dock
# defaults write com.apple.dock no-bouncing -bool FALSE && killall Dock

# Set the icon size of Dock items to 44 pixels
defaults write com.apple.dock tilesize -int 44

# Mission Control

# Disable space rearrange
defaults write com.apple.dock mru-spaces -bool FALSE
