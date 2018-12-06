#!/usr/bin/env bash
# macOS X initial setup
#
# Installed via brew:
# Homebrew, Node, Yarn, Git, Bash, PHP7, Composer, wget, Go, htop, Screenfetch, Speedtest-cli, WP CLI & Ansible,
#
# Installed via brew cask:
# Vagrant, Virtualbox, Google Chrome, VS Code, Skype, Telegram, Whatsapp, Qbittorrent, Spotify, Keka, Iina, Adobe Creative Cloud, Nextcloud, Sequel Pro, Postman, Firefox & 1Password.
#
# Plus a few additional settings to speed up my workflow.
#
# @author Pablo Bustamante, 2018

# Update the system and install the basic 
sudo softwareupdate -i -a
xcode-select --install

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
BREW_PREFIX=$(brew --prefix)

brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

brew install grep
brew install openssh
brew cleanup
# Basic tools
brew install zsh git wget htop php ansible node yarn composer  go screenfetch speedtest-cli wp-cli terminal-notifier
terminal-notifier -title "macOS setup" -subtitle "Basic tools" -message "Done!"  -sound default

# Additional tools
brew cask install firefox google-chrome telegram-desktop whatsapp skype
brew cask install iterm2 visual-studio-code virtualbox vagrant sequel-pro postman cyberduck macdown
brew cask install qbittorrent spotify keka iina adobe-creative-cloud nextcloud dropbox

terminal-notifier -title "macOS setup" -subtitle "Brew Casks" -message "Done!"  -sound default


excludesfile = ~/.gitignore
attributesfile = ~/.gitattributes

# This is needed to be able to finish the Creative Cloud setup
open '/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app'

# Oh my ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Enable install from all sources
sudo spctl --master-disable

# Upgrade PIP and Setuptools
pip install --upgrade pip setuptools

#-------------------------------
# Bash exports
#-------------------------------
echo 'export PATH="/usr/local/opt/libxml2/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/libpq/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/gettext/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/icu4c/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/icu4c/sbin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/apr/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/openssl/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="/usr/local/opt/apr-util/bin:$PATH"' >> ~/.bash_profile
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bash_profile
echo '# Nicer prompt.' >> ~/.bash_profile
echo 'export PS1="\[\e[0;32m\]\]\[\] \[\e[1;32m\]\]\t \[\e[0;2m\]\]\w \[\e[0m\]\]\[$\] "' >> ~/.bash_profile
echo '# Use colors.' >> ~/.bash_profile
echo 'export CLICOLOR=1' >> ~/.bash_profile
echo 'export LSCOLORS=ExFxCxDxBxegedabagacad' >> ~/.bash_profile

#-------------------------------
# General settings
#-------------------------------
# Disable empty trash warning
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Disable gamed
sudo defaults write /System/Library/LaunchAgents/com.apple.gamed disabled -bool true
# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning false
# Quit printer app once done
defaults write com.apple.print.PrintingPrefs "Quit When Finished" true
# Reset launchpad
find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
# Screenshots in jpg format
defaults write com.apple.screencapture type -string "jpg"
# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Show the ~/Library folder
chflags nohidden ~/Library
# Use UTF-8 in terminal app
defaults write com.apple.terminal StringEncodings -array 4
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2
# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# Use column view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# Set the icon size of Dock items
defaults write com.apple.dock tilesize -int 30
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# Use the system print dialog
defaults write com.google.Chrome DisablePrintPreview -bool true
# Disable local Time Machine snapshots
sudo tmutil disablelocal
# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0
# Remove the sleep image file to save disk space
sudo rm /Private/var/vm/sleepimage
# Create a zero-byte file instead...
sudo touch /Private/var/vm/sleepimage
# ...and make sure it can’t be rewritten
sudo chflags uchg /Private/var/vm/sleepimage

#-------------------------------
# Duplicacy
#-------------------------------
printf "Setting up duplicacy"
mkdir $HOME/Go
mkdir -p $HOME/Go/src/github.com/user
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
cd ~/
go get -u github.com/gilbertchen/duplicacy/...
cd $GOPATH/src/github.com/gilbertchen/duplicacy
go build duplicacy/duplicacy_main.go

#-------------------------------
# Laravel
#-------------------------------
printf "Setting up Laravel Homestead"
composer global require "laravel/installer"
vagrant box add laravel/homestead
git clone https://github.com/laravel/homestead.git ~/Homestead
cd ~/Homestead
git checkout v7.16.1
chmod +x init.sh
./init.sh
ssh-keygen -b 4096
ssh-add -K

#-------------------------------
# Fonts
#-------------------------------
cd ~/Projects
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Git Ignore
echo '.DS_Store' >> ~/.gitignore
echo 'Desktop.ini' >> ~/.gitignore
echo '._*' >> ~/.gitignore
echo 'Thumbs.db' >> ~/.gitignore
echo '.Spotlight-V100' >> ~/.gitignore
echo '.Trashes' >> ~/.gitignore

echo 'excludesfile = ~/.gitignore' >> ~/.gitconfig


printf "Done! You now need to logout and login again so that all the new settings work.\n"