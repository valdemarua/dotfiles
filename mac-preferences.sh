#!/usr/bin/env bash

# Close System Preferences
osascript -e 'tell application "System Preferences" to quit'

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

################################################
# Finder
################################################

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

################################################
# Dock
################################################

# Hide Dock
defaults write com.apple.dock autohide -bool true # && killall Dock
defaults write com.apple.dock autohide-delay -float 0 # && killall Dock
defaults write com.apple.dock no-bouncing -bool TRUE # && killall Dock

# Restore Dock
# defaults write com.apple.dock autohide -bool false && killall Dock
# defaults delete com.apple.dock autohide-delay && killall Dock
# defaults write com.apple.dock no-bouncing -bool FALSE && killall Dock

# Set the icon size of Dock items to 44 pixels
defaults write com.apple.dock tilesize -int 40

# Mission Control

# Disable space rearrange
defaults write com.apple.dock mru-spaces -bool FALSE

# Hot Corners

# Corners:
#
# tl - top left
# tr - top right
# bl - bottom left
# br - bottom right
#
# Options:
#
# 0: No Option
# 2: Mission Control
# 3: Show Application Windows
# 4: Desktop
# 5: Start Screen Saver
# 6: Disable Screen Saver
# 7: Dashboard
# 10: Put Display to Sleep
# 11: Launchpad
# 12: Notification Centre
# 13: Lock Screen
#
# Modifiers
#
# 0: No Modifier
# 131072: Shift Key
# 262144: Control Key
# 524288: Option Key
# 1048576: Command Key

# Set Hot Corner Shortuct
defaults write com.apple.dock wvous-tl-corner -int 13
defaults write com.apple.dock wvous-tr-corner -int 4

# Set Modifiers
defaults write com.apple.dock wvous-tl-modifier -int 1048576
defaults write com.apple.dock wvous-tr-modifier -int 1048576

################################################
# Screenshots
################################################

mkdir -p ~/Documents/Screenshots
defaults write com.apple.screencapture "location" -string "~/Documents/Screenshots"

# Restart the Dock
killall Dock
