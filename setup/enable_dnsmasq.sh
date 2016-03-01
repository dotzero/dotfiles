# ----------------------
# installing dnsmasq and enable daemon
# ----------------------
brew install dnsmasq
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
# ----------------------
# adding resolver for .dev domain
# ----------------------
[ -d /etc/resolver ] || sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
# ----------------------
# configuring dnsmasq
# ----------------------
cat > $(brew --prefix)/etc/dnsmasq.conf <<-EOF
bind-interfaces
keep-in-foreground
no-resolv
address=/dev/127.0.0.1
listen-address=127.0.0.1
EOF
# ----------------------
# launching dnsmasq
# ----------------------
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
