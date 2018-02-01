#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew install git
brew install git-lfs
brew install git-flow

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Core casks
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" android-studio
brew install android-sdk

# Development tool casks
brew cask install --appdir="/Applications" visual-studio-code
brew install docker docker-compose docker-machine xhyve docker-machine-driver-xhyve

# Misc casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" slack

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
brew install yarn --without-node
echo "------------------------------"
echo "Setting up pip."
# Install pip
easy_install pip
echo "------------------------------"
echo "Setting up pip."
pip3 install awscli

nvm install 6.10.2

brew cleanup
npm install -g eslint
npm install -g react-native-cli
npm install -g serverless


# Remove outdated versions from the cellar.
brew cleanup
