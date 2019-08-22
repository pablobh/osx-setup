#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

get_homebrew_git_config_file_path() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --repository 2> /dev/null)/.git/config"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get config file path)"
        return 1
    fi

}

install_homebrew() {

    if ! cmd_exists "brew"; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    print_result $? "Homebrew"

}

opt_out_of_analytics() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Try to get the path of the `Homebrew` git config file.

    path="$(get_homebrew_git_config_file_path)" \
        || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Opt-out of Homebrew's analytics.
    # https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out

    if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
        git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
    fi

    print_result $? "Homebrew (opt-out of analytics)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Homebrew\n\n"

    install_homebrew
    opt_out_of_analytics

    brew_update
    brew_upgrade

}

main



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