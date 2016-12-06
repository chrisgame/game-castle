source ~/.promptline.conf
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

source $(brew --prefix nvm)/nvm.sh

# User configuration

export PATH="/Users/chris/.rvm/gems/ruby-2.1.2/bin:/Users/chris/.rvm/gems/ruby-2.1.2@global/bin:/Users/chris/.rvm/rubies/ruby-2.1.2/bin:/Users/chris/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/chris/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="/usr/local/Cellar/vim/7.4.903/bin/vim"
#alias nom="rm -rf node_modules && npm cache clean && npm install"
#alias nombom="rm -rf node_modules bower_components dist tmp && npm cache clean && npm install && bower install"
###
# Super Spinner
# An emoji-based spinner — because ASCII is boring.
#
# Usage:
# $ COMMAND & superSpinner $! "Message"
#
# Example:
# $ sleep 5 & superSpinner $! "Sleeping for 5 seconds"
#
# Output:
# $ 🕐 Sleeping for 5 seconds...
# $ 💥 Sleeping for 5 seconds.... Finished!
###
superSpinner() {
  local PID=$1
  local CLOCK_STR=("🕐" "🕑" "🕒" "🕓" "🕔" "🕕" "🕖" "🕗" "🕘" "🕙" "🕚" "🕛")
  local IDX=0

  tput civis
  echo -ne "\r"

  while kill -0 "$PID" 2> /dev/null ; do
    echo -ne "${CLOCK_STR[$IDX]}  $2...\r"
    IDX=$(( IDX == 11 ? 0 : IDX + 1 ))
    sleep 0.08333333333
  done

  echo -ne "\r💥  $2.... Finished!"
  echo
  tput cnorm
}
###
# Handy Ember NomBom
# N.B. Meant to be used with Super Spinner
# https://gist.github.com/zulaica/9e971cc5b6dbd156abcd13745beff262
#
# Usage:
# $ nombom
#
# WTF:
# 1. Delete node_modules, bower_components, dist, and tmp directories
# 2. Clear both NPM and Bower caches
# 3. Prevent macOS Spotlight from indexing node_modules and bower_components
# 4. Install NPM and Bower packages
# 5. Reset watchman
# 6. Display a success message
###
alias nbDelete="rm -rf node_modules/* bower_components/* dist tmp"
alias nbCache="npm cache clean --silent && bower cache clean --silent"
alias nbScaffold="touch node_modules/.metadata_never_index && touch bower_components/.metadata_never_index"
alias nbInstall="npm install --silent > /dev/null 2>&1 && bower install --silent > /dev/null 2>&1"
alias nbWatchman="watchman watch-del $PWD > /dev/null 2>&1 ; watchman watch-project $PWD > /dev/null 2>&1"
nbsuccess() {
  local MESSAGE="💥💥💥 💣 ❕❗️ 𝔑 𝟎 𝔐 𝔅 𝟎 𝔐 ❗️❕ 💣 💥💥💥"
  local NUM_COLS=$( tput cols )
  local NUM_ROWS=$( tput lines )
  local OFFSET_MESSAGE=$(( ${#MESSAGE} / 2 ))
  local OFFSET_COLS=$(( NUM_COLS / 2 - OFFSET_MESSAGE ))
  local OFFSET_ROWS=$(( NUM_ROWS / 2 ))

  tput clear
  tput civis
  tput cup $OFFSET_ROWS $OFFSET_COLS
  echo "$MESSAGE"
  sleep 2
  tput cnorm
  tput clear
}
nombom() {
  nbDelete & superSpinner $! "Deleting old files"
  nbCache & superSpinner $! "Clearing NPM and Bower caches"
  nbScaffold & superSpinner $! "Preventing macOS Spotlight from indexing"
  nbInstall & superSpinner $! "Installing NPM and Bower packages"
  nbWatchman & superSpinner $! "Resetting Watchman"
  nbsuccess
}

# added by travis gem
[ -f /Users/chris/.travis/travis.sh ] && source /Users/chris/.travis/travis.sh
