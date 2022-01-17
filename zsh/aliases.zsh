# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias dt="cd ~/Desktop"
alias dn="cd ~/Downloads"

alias ls="ls -G"
alias la="ls -AGFoh"
alias grep="grep --color=auto"

alias rsynccopy="rsync --partial --progress --append --rsh=ssh -r -h " # cp with progressbar
alias rsyncmove="rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files " # mv with progressbar

# OSX
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias flush="dscacheutil -flushcache" # Flush DNS cache
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'" # Copy my public key to the pasteboard
alias deadsym="find / -type l ! -exec test -r {} \; -print" # Find "dead" symbolic links ?
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system;echo "Open With has been rebuilt"'
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder" # Show hidden files in Finder
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder" # Hide hidden files in Finder
alias rmds="find . -name '.DS_Store' -depth -exec rm -v {} \;"
alias chrome="open -a Google\ Chrome"
alias map="xargs -n1"

# Other tools
alias dos2unix="perl -pi -e 's/\r\n/\n/g'"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias getpage="wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories" # Download web page with all assets
