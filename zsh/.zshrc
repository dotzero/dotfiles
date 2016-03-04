# ZSH Settings
export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.0/zsh
ZSH_THEME="pure"
DISABLE_AUTO_UPDATE="true"
plugins=(brew composer cp docker fabric git rsync vagrant golang)
source $ZSH/oh-my-zsh.sh

export TERM="xterm-256color"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$HOME/.0/bin:$PATH"
export PATH=$PATH:~/.composer/vendor/bin # Composer
export PATH=$PATH:/usr/local/opt/go/libexec/bin # Go Compiler
export EDITOR="nano"

export HISTCONTROL=ignoredups # Ignore duplicate commands in the history
export HISTFILESIZE=10000 # Increase the maximum number of lines contained in the history file
export HISTSIZE=10000 # Increase the maximum number of commands to remember

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/dev/golang
export PATH=$PATH:$GOPATH/bin

# Virtualenvwrapper
#export WORKON_HOME="$HOME/.virtualenvs"
#source /usr/local/bin/virtualenvwrapper.sh

# Allow aliases to be with sudo
alias sudo="sudo "

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias dn='cd ~/Downloads'
alias tm='cd ~/dev/tm'

alias ls="ls -G"
alias la="ls -AGFoh"
alias grep="grep --color=auto"

alias rsynccopy="rsync --partial --progress --append --rsh=ssh -r -h " # cp with progressbar
alias rsyncmove="rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files " # mv with progressbar

# OSX
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias flush="dscacheutil -flushcache" # Flush DNS cache
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'" # Copy my public key to the pasteboard
alias deadsym="find / -type l ! -exec test -r {} \; -print" # Find "dead" symbolic links ?
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system;echo "Open With has been rebuilt"'
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder" # Show hidden files in Finder
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder" # Hide hidden files in Finder
alias rmds="sudo find / -name '.DS_Store' -depth -exec rm {} \;"

# Download web page with all assets
alias getpage="wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories"

# Vagrant
alias vagup="vagrant up"
alias vaghalt="vagrant halt"

# Mongo
alias mongoup="mongod --config /usr/local/etc/mongod.conf"

# Redis
alias redisup="redis-server /usr/local/etc/redis.conf"

# Encfs
alias encfsup='encfs ~/Dropbox/Private.enc/ ~/Private/ -- -o volname="Dropbox private"'
alias encfsdown='umount ~/Dropbox/Private.enc/'

# Virtualenv
alias venv='test -d .env && source ./.env/bin/activate || echo "No Virtualenv in the current folder."'
alias venv-init='test -d .env && echo "Virtualenv already exists." || virtualenv --no-site-packages .env; venv'

# Other tools
alias dos2unix="perl -pi -e 's/\r\n/\n/g'"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Create a data URI from a file and copy it to the pasteboard
function datauri {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8"
    fi
    printf "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')" | pbcopy | printf "=> data URI copied to pasteboard.\n"
}

# Test if HTTP compression (RFC 2616 + SDCH) is enabled for a given URL.
# Send a fake UA string for sites that sniff it instead of using the Accept-Encoding header. (Looking at you, ajax.googleapis.com!)
function httpcompression() {
    encoding="$(curl -LIs -H 'User-Agent: Mozilla/5 Gecko' -H 'Accept-Encoding: gzip,deflate,compress,sdch' "$1" | grep '^Content-Encoding:')" && echo "$1 is encoded using ${encoding#* }" || echo "$1 is not using any encoding"
}

# Show HTTP headers for given URL
# USAGE: headers <URL>
# https://github.com/rtomayko/dotfiles/blob/rtomayko/bin/headers
function headers() {
    curl -sv -H "User-Agent: Mozilla/5 Gecko" "$@" 2>&1 >/dev/null |
        grep -v "^\*" |
        grep -v "^}" |
        cut -c3-
}

# Find files with Windows line endings (and convert then to Unix in force mode)
# USAGE: crlf [file] [--force]
function crlf() {
    local force=

    # Single file
    if [ "$1" != "" ] && [ "$1" != "--force" ]; then
        [ "$2" == "--force" ] && force=1 || force=0
        _crlf_file $1 $force
        return
    fi

    # All files
    [ "$1" == "--force" ] && force=1 || force=0
    for file in $(find . -type f -not -path "*/.git/*" -not -path "*/node_modules/*" | xargs file | grep ASCII | cut -d: -f1); do
        _crlf_file $file $force
    done
}
function _crlf_file() {
    grep -q $'\x0D' "$1" && echo "$1" && [ $2 ] && dos2unix "$1"
}

# Change directory to the current Finder directory
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# Start an Python HTTP server from a directory, optionally specifying the port
function pyserver {
    # Get port (if specified)
    local port="${1:-8000}"

    # Open in the browser
    open "http://localhost:${port}/"

    # Redefining the default content-type to text/plain instead of the default
    # application/octet-stream allows "unknown" files to be viewable in-browser
    # as text instead of being downloaded.
    #
    # Unfortunately, "python -m SimpleHTTPServer" doesn't allow you to redefine
    # the default content-type, but the SimpleHTTPServer module can be executed
    # manually with just a few lines of code.
    python -c $'import SimpleHTTPServer;\nSimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map[""] = "text/plain";\nSimpleHTTPServer.test();' "$port"
}

# Start an PHP HTTP server from a directory, optionally specifying the port
function phpserver {
    # Get port (if specified)
    local port="${1:-8000}"

    # Open in the browser
    open "http://localhost:${port}/"

    # Run built-in web server
    php -S "localhost:${port}"
}

# The following script will display the 16 colors in the terminal
function bash_colors {
    echo -e "\033[0mCOLOR_NC (No color)"
    echo -e "\033[1;37mCOLOR_WHITE\t\033[0;30mCOLOR_BLACK"
    echo -e "\033[0;34mCOLOR_BLUE\t\033[1;34mCOLOR_LIGHT_BLUE"
    echo -e "\033[0;32mCOLOR_GREEN\t\033[1;32mCOLOR_LIGHT_GREEN"
    echo -e "\033[0;36mCOLOR_CYAN\t\033[1;36mCOLOR_LIGHT_CYAN"
    echo -e "\033[0;31mCOLOR_RED\t\033[1;31mCOLOR_LIGHT_RED"
    echo -e "\033[0;35mCOLOR_PURPLE\t\033[1;35mCOLOR_LIGHT_PURPLE"
    echo -e "\033[0;33mCOLOR_YELLOW\t\033[1;33mCOLOR_LIGHT_YELLOW"
    echo -e "\033[1;30mCOLOR_GRAY\t\033[0;37mCOLOR_LIGHT_GRAY"
}

# Image Capture Extension killer, it use 100 CPU
function kill_image_capture {
    local PID=$(ps aux | grep "Image Capture Extension" | grep -v grep | awk '{print $2}');

    if [ -z $PID ]; then
      exit 1;
    fi

    echo "Image Capture Extension - Killed."
}
