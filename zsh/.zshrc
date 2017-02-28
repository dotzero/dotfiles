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

# Exports
# ---------------------------------------
export LC_ALL=ru_RU.UTF-8
export LANG="ru_RU"
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
[ -d $ZROOT/bin ] && _prepend_path "$ZROOT/bin"
[ -d $HOME/.composer/vendor/bin ] && _prepend_path "$HOME/.composer/vendor/bin"
[ -d /usr/local/opt/php56/bin ] && _prepend_path "/usr/local/opt/php56/bin"
[ -d /usr/local/opt/go/libexec/bin ] && _prepend_path "/usr/local/opt/go/libexec/bin"
export PATH
export TERM="xterm-256color"
export EDITOR="nano"
export HISTCONTROL="ignoredups" # Ignore duplicate commands in the history
export HISTFILESIZE=10000 # Increase the maximum number of lines contained in the history file
export HISTSIZE=10000 # Increase the maximum number of commands to remember

# Virtualenvwrapper
# ---------------------------------------
if [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ]; then
	export WORKON_HOME="$HOME/.virtualenvs"
	export VIRTUALENVWRAPPER_SCRIPT="/usr/local/bin/virtualenvwrapper.sh"
	source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

# Golang
# ---------------------------------------
if [ -d $ZROOT/bin ]; then
  export GOROOT="/usr/local/opt/go/libexec"
  export GOPATH="$HOME/go"
  _prepend_path "$GOPATH/bin"
fi

# Load extra (private) settings
[ -f ~/.zshlocal ] && source ~/.zshlocal
