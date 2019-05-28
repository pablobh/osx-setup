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

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update the system and install the basic 
sudo softwareupdate -i -a
xcode-select --install

sh /src/brew.sh
sh /src/brew-dev.sh
sh /src/cask.sh
sh /src/cask-qlplugins.sh
sh /src/cask-dev.sh

# Cleanup
brew cleanup

# Enable install from all sources
sudo spctl --master-disable

# Upgrade PIP and Setuptools
pip install --upgrade pip setuptools

sh /src/macOS-prefs.sh
sh /src/git-config.sh
sh /src/zsh-config.sh


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

# Git Ignore
echo '.DS_Store' >> ~/.gitignore
echo 'Desktop.ini' >> ~/.gitignore
echo '._*' >> ~/.gitignore
echo 'Thumbs.db' >> ~/.gitignore
echo '.Spotlight-V100' >> ~/.gitignore
echo '.Trashes' >> ~/.gitignore
echo '[core]' >> ~/.gitconfig
echo 'excludesfile = ~/.gitignore' >> ~/.gitconfig

# Oh my ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
exit
curl -L -o ~/.oh-my-zsh/custom/themes/materialshell.zsh-theme https://raw.githubusercontent.com/carloscuesta/materialshell/master/materialshell.zsh
rm ~/.zshrc
cp zshconfig ~/.zshrc

printf "Done! You now need to logout and login again so that all the new settings work.\n"