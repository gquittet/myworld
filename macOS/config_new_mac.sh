#!/usr/bin/env sh

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# ===================================
#               Dev
# ===================================
# Shell
brew install bash
brew install fish
brew install zsh

# Set fish a my default shell
sudo echo `which fish` >> /etc/shells
chsh -s `which fish`

# Editor
brew cask install jetbrains-toolbox
brew install neovim
brew cask install visual-studio-code

# Languages
# Dart
brew install dart-lang/dart/dart
# Deno
brew install deno
# Java
brew install gradle
# Haskell
brew install haskell-stack
# Node
brew install node@10
brew install node@12
brew install nvm
brew install yarn
# Python
brew install pipenv
brew install pyenv-virtualenv
brew install pypy3
# Ruby
brew install rbenv

# Git
brew install diff-so-fancy
brew install git-extras

# Shell Tools
brew install bat
brew install ctags
brew install curl
brew install exa
brew install fx
brew install fzf
brew install htop
brew install less
brew install ripgrep
brew install starship
brew install watch
brew install z

# Tools
brew cask install docker
brew cask install insomnia
brew cask install iterm2
brew cask install postman
brew cask install robo-3t

# Kubernetes
brew install helm
brew install derailed/k9s/k9s
brew install minikube

brew install mongodb/brew/mongodb-community
brew install msodbcsql
brew install plantuml
brew install stow
brew install tmux
brew install youtube-dl
brew install zplug

# Fonts
brew cask install font-anonymouspro-nerd-font
brew cask install font-anonymouspro-nerd-font-mono
brew cask install font-cascadia-nerd-font-mono
brew cask install font-fantasquesansmono-nerd-font
brew cask install font-fantasquesansmono-nerd-font-mono
brew cask install font-firacode-nerd-font
brew cask install font-firacode-nerd-font-mono
brew cask install font-hasklig-nerd-font
brew cask install font-hasklig-nerd-font-mono
brew cask install font-iosevka-nerd-font
brew cask install font-iosevka-nerd-font-mono
brew cask install font-jetbrains-mono-nerd-font

# Browsers
brew cask install google-chrome
brew cask install firefox

# ===================================
#             Life saving
# ===================================
brew cask install alfred
brew cask install alt-tab
brew cask install mos
brew cask install rectangle

# ===================================
#             Utilities
# ===================================
brew cask install adguard
brew cask install appcleaner
# Use for rar, tar.gz + better zip tool
brew cask install keka


# ===================================
#            Disk support
# ===================================
brew cask install cyberduck # ftp, amazon s3, webdav, etc
brew install ntfs-3g
brew cask install osxfuse


# ===================================
#               Video
# ===================================
brew cask install obs
brew cask install obs-virtualcam
brew cask install vlc


# ===================================
#           Communication
# ===================================
brew cask install teamviewer
brew cask install zoomus


# Tools
brew cask install adobe-creative-cloud
brew cask install clockify
brew cask install gpg-suite
brew cask install minikube
brew cask install tunnelblick
brew cask install vmware-fusion
brew cask install wireshark
