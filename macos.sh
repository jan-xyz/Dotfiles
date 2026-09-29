#!/usr/bin/env bash
set -euo pipefail

defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 20
defaults write com.apple.dock minimize-to-application -int 1
defaults write com.apple.dock show-process-indicators -int 1
defaults write com.apple.dock mru-spaces -int 0
defaults write com.apple.dock show-recents -int 0
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.ActivityMonitor IconType -int 6

killall Dock
