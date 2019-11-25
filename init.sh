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

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget`
brew install wget

# Install Python
brew install python3
brew install pipenv

# Install more recent versions of some OS X tools.
brew install neovim
brew install grep
brew install openssh
brew install openssl
brew install screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-roboto-mono
brew cask install font-hack

# Install other tools
brew install autossh
brew install bat
brew install cmake
brew install diff-so-fancy
brew install fd
brew install fx
brew install fzf
brew install git
brew install htop
brew install httpie
brew install jq
brew install make
brew install ripgrep
brew install ruby
brew install speedtest_cli
brew install ssh-copy-id
brew install tig
brew install tldr
brew install tmux
brew install tree

# Install Cask
brew tap homebrew/cask-cask

# Core casks
brew cask install iterm2

# Development tool casks
brew cask install sublime-text
brew cask install visual-studio-code

# Misc casks
brew cask install clipy
brew cask install fantastical
brew cask install firefox-developer-edition
brew cask install google-chrome
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install telegram-desktop
brew cask install transmission
brew cask install vlc

# Remove outdated versions from the cellar.
brew cleanup
