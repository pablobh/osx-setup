# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
BREW_PREFIX=$(brew --prefix)
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Shell tools
brew install coreutils
brew install grep
brew install openssh
brew install python
brew install python3
brew install nano
brew install screen
brew install rsync
brew install git
brew install wget --with-iri
brew install htop
brew install screenfetch
brew install speedtest-cli
brew install tree
brew install terminal-notifier
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
terminal-notifier -title "macOS setup" -subtitle "Shell tools" -message "Done"  -sound default