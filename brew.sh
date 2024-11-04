#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew, install if we don't have it
if ! command -v brew &> /dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install essential tools
brew install git git-lfs git-flow git-secrets

# Install Cask (now part of Homebrew)
brew install --cask java8 android-studio google-chrome firefox skype slack visual-studio-code

# Install Docker and related tools
brew install docker docker-compose

# Install Node.js and npm (using NVM for version management)
if ! command -v nvm &> /dev/null; then
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi
nvm install node  # Install the latest Node.js
npm install -g npm@latest  # Update npm to the latest version

# Install global npm packages for React and React Native
npm install -g create-react-app react-native-cli

# Install Yarn
brew install yarn

# Install Dart and Flutter
brew tap dart-lang/dart
brew install dart
brew install --cask flutter

# Install databases
brew install mongodb-community@6.0  # MongoDB
brew install postgresql  # PostgreSQL
brew install redis  # Redis

# Install AWS CLI
brew install python3
pip3 install --upgrade pip
pip3 install awscli

# Install global npm packages for linting and serverless
npm install -g eslint serverless

# Cleanup outdated versions
brew cleanup

echo "Development environment setup complete!"
