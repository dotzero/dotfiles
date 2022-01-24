# Oh My Dotfiles root
# ---------------------------------------
ZROOT=$HOME/.0

# Oh My Zsh
# ---------------------------------------
[ -f $ZROOT/zsh/.oh-my-zsh ] && source $ZROOT/zsh/.oh-my-zsh

# Prepend $PATH without duplicates
function _prepend_path() {
  if ! $( echo "$PATH" | tr ":" "\n" | grep -qx "$1" ) ; then
    PATH="$1:$PATH"
  fi
}

# Paths
# ---------------------------------------
PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
[ -d $ZROOT/bin ] && _prepend_path "$ZROOT/bin"
[ -d $HOME/.composer/vendor/bin ] && _prepend_path "$HOME/.composer/vendor/bin"
[ -d $HOME/yandex-cloud/bin ] && _prepend_path "$HOME/yandex-cloud/bin"
[ -d $HOME/.poetry/bin ] && _prepend_path "$HOME/.poetry/bin"

# Homebrew
# ---------------------------------------
if [ -d /opt/homebrew/bin ]; then
  source <(/opt/homebrew/bin/brew shellenv)
fi

# Golang
# ---------------------------------------
if [ -d $HOME/go ]; then
  export GOPATH="$HOME/go"
  _prepend_path "$GOPATH/bin"
fi
if [ -d /opt/homebrew/opt/go/libexec ]; then
  export GOROOT="/opt/homebrew/opt/go/libexec"
fi

# Exports
# ---------------------------------------
export PATH
export LC_ALL=en_US.UTF-8
export LANG="ru_RU"
export TERM="xterm-256color"
export EDITOR="nano"
export HISTCONTROL="ignoredups" # Ignore duplicate commands in the history
export HISTFILESIZE=10000 # Increase the maximum number of lines contained in the history file
export HISTSIZE=10000 # Increase the maximum number of commands to remember
export GIT_FRIENDLY_NO_COMPOSER=true # git-friendly
export GIT_FRIENDLY_NO_NPM=true # git-friendly

# Virtualenvwrapper
# ---------------------------------------
if [ -f /opt/homebrew/bin/virtualenvwrapper_lazy.sh ]; then
  export e="$HOME/.virtualenvs"
  export VIRTUALENVWRAPPER_PYTHON="/opt/homebrew/bin/python3"
  export VIRTUALENVWRAPPER_SCRIPT="/opt/homebrew/bin/virtualenvwrapper.sh"
  source /opt/homebrew/bin/virtualenvwrapper_lazy.sh
fi

# Add all known keys to the SSH agent
ssh-add -A 2>/dev/null;

# Load extra (private) settings
[ -f ~/.zshlocal ] && source ~/.zshlocal
