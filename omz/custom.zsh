#############
# My settings
#############

__git_checkout_hard() {
    local b
    if [ $# -eq 0 ]; then
        b="master"
    else
        b="$1"
    fi
    git checkout . && \
    git fetch --all && \
    git checkout "$b" && \
    git reset --hard "origin/$b"
}

__brew_update() {
    local green="\x1B[1m\x1B[32m"
    local underline="\x1B[4m"
    local reset="\x1B[0m"

    p() { printf "${green}${underline}%s${reset}\n\n" "$1"; }

    p "Clearing old packages..."
    brew cleanup

    p "Upgrading formulae..."
    brew update && brew upgrade

    p "Upgrading casks..."
    if brew list --casks >/dev/null 2>&1; then
        brew list --casks | xargs brew upgrade --casks
    else
        p "No casks installed."
    fi

    p "Clearing download cache..."
    brew cleanup

    p "Pruning download cache..."
    brew cleanup --prune=all
}

# Alias
alias n='nvim'
alias dcu='docker compose up'
alias dcl='docker compose logs -f'
alias tt='cd ~/Projects'
alias mm='cd ~/Projects/mine'
alias hs='cd ~/Projects/mine/homeserver'
alias ghr=__git_checkout_hard
alias brew-update=__brew_update
alias hg='history | grep'
# Diable ArcBrowser updates
# test -e /Applications/Arc.app/Contents/Info.plist && (p "\nDisabling Arc Browser auto-updates"; /usr/libexec/PlistBuddy -c "Set SUAutomaticallyUpdate false" /Applications/Arc.app/Contents/Info.plist; /usr/libexec/PlistBuddy -c "Set SUEnableAutomaticChecks false" /Applications/Arc.app/Contents/Info.plist; /usr/libexec/PlistBuddy -c "Set SUScheduledCheckInterval 0" /Applications/Arc.app/Contents/Info.plist);

# Include custom Projects scripts
export PATH=$PATH:$HOME/Projects/sync/scripts/bin

# Include homebrew on PATH
export PATH=$PATH:/opt/homebrew/bin

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish


# export HISTSIZE=1000000
# export SAVEHIST=1000000
# setopt HIST_IGNORE_ALL_DUPS
# setopt HIST_FIND_NO_DUPS
# setopt HIST_REDUCE_BLANKS

