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

# Install Python
brew install python3
brew install pipenv

# Install more recent versions of some OS X tools.
brew install neovim
brew install coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt grep
brew install openssh
brew install openssl

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew tap homebrew/cask-fonts
brew install font-fira-code
brew install font-roboto-mono
brew install font-hack

# Install other tools
brew install wget
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
brew install reattach-to-user-namespace
brew install ripgrep
brew install ruby
brew install speedtest_cli
brew install ssh-copy-id
brew install tldr
brew install tmux
brew install tmux-xpanes
brew install tree
brew install yq

# Core casks
brew install iterm2

# Development tool casks
brew install sublime-text
brew install visual-studio-code

# Misc casks
brew install clipy
brew install fantastical
brew install firefox-developer-edition
brew install google-chrome
brew install slack
brew install spectacle
brew install spotify
brew install telegram-desktop
brew install transmission
brew install vlc
brew install whatsapp

# Extra setup
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p "$(bat --config-dir)/syntaxes"
curl -o "$(bat --config-dir)/syntaxes/vue.sublime-syntax" https://raw.githubusercontent.com/vuejs/vue-syntax-highlight/new/Vue%20Component.sublime-syntax

# Remove outdated versions from the cellar.
brew cleanup

echo ' --------------------------------------------------'
echo '| Run tmux and press prefix + I to get all plugins |'
echo ' --------------------------------------------------'
