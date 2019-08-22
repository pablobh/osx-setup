echo -e "\e[32mInstalling mini package"
# Update the system and install the basic
sudo softwareupdate -i -a
xcode-select --install
# Enable install from all sources
sudo spctl --master-disable

#Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Shell tools
brew install coreutils
brew install grep
brew install openssh
brew install python
brew install python3
brew install nano
brew install screen
brew install git
brew install wget --with-iri
brew install htop
brew install speedtest-cli
brew install terminal-notifier
brew install zsh
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
echo -e "\e[32mDone\!"
terminal-notifier -title "macOS setup" -subtitle "Shell tools" -message "Done"  -sound default