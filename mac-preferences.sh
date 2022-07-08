#!/bin/sh

# Dock

# Hide Dock
defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock autohide-delay -float 0 && killall Dock
defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock

# Restore Dock
# defaults write com.apple.dock autohide -bool false && killall Dock
# defaults delete com.apple.dock autohide-delay && killall Dock
# defaults write com.apple.dock no-bouncing -bool FALSE && killall Dock
