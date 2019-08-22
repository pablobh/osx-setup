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

echo "\e[96mOSX Setup Script"
echo "Write the package you would like to install"
echo "\e[1mmini - The basic things to get your system ready"
echo "\e[1mdev - Mini + Developer stuff"
echo "\e[1mdesign - Mini + Designer stuff"
echo "\e[1mextra - Extra nice things"
echo "\e[1mfull - The whole thing"
echo "\e[1mlist - Print a list of all the things included in each package"
echo "\e[1mquit - Quit the script"
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	mini)
		echo "Installing mini package"
        ./src/mini.sh
		;;
	dev)
		echo "Installing dev package"
        ./src/dev.sh
		;;
	design)
		echo "Installing design package"
        ./src/design.sh
		;;
	extra)
		echo "Installing extra package"
        ./src/extra.sh
		;;
	full)
		echo "Installing full package"
        ./src/full.sh
		;;
	list)
		echo "Listing packages availables to install"
        ./src/list.sh
		break
		;;
	quit)
		echo "Listing packages availables to install"
        exit
		break
		;;
	*)
		echo "Sorry, I don't understand"
		;;
  esac
done
echo 
echo "That's all folks!"

# Cleanup
brew cleanup

# Upgrade PIP and Setuptools
pip install --upgrade pip setuptools

./src/macOS-prefs.sh
./src/git-config.sh
./src/zsh-ohmyzsh.sh


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

printf "Done! You now need to logout and login again so that all the new settings work.\n"