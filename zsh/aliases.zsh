# Travelesting
alias ..="cd .."
alias ...="cd ../.."
alias dt="cd ~/Desktop"
alias dn="cd ~/Downloads"

# Listing
alias ls="ls -G"
alias la="ls -AGFoh"
alias grep="grep --color=auto"

# File manipulation
alias rsynccopy="rsync --partial --progress --append --rsh=ssh -r -h " # cp with progressbar
alias rsyncmove="rsync --partial --progress --append --rsh=ssh -r -h --remove-sent-files " # mv with progressbar
alias rmds="find . -name '.DS_Store' -depth -exec rm -v {} \;" # rm .DS_Store files
alias dos2unix="perl -pi -e 's/\r\n/\n/g'"

# Networking
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias flush="dscacheutil -flushcache" # Flush DNS cache
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | printf '=> Public key copied to pasteboard.\n'" # Copy my public key to the pasteboard
