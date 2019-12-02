#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install development tools
brew cask install docker
brew cask install sequel-pro

# Install node LTS
brew install n
sudo n lts

# Install global packages
npm install -g npkill
npm install -g npm-check-updates

# Install gcloud
brew cask install google-cloud-sdk
gcloud components install beta
gcloud components install bq
gcloud components install gsutil

# Install k8s stuff
brew install kubectl
brew install kubectx
brew install minikube

# Remove outdated versions from the cellar.
brew cleanup
