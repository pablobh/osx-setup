# Additional tools
brew cask install nextcloud
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install telegram-desktop
brew cask install whatsapp
brew cask install skype
brew cask install qbittorrent
brew cask install spotify
brew cask install keka
brew cask install iina
brew cask install adobe-creative-cloud
# This is needed to be able to finish the Creative Cloud setup
open '/usr/local/Caskroom/adobe-creative-cloud/latest/Creative Cloud Installer.app'
terminal-notifier -title "macOS setup" -subtitle "macOS Apps" -message "Done"  -sound default