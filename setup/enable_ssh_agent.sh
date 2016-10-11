# ----------------------
# setup and launching daemon
# ----------------------
sudo cp -v ./ssh.add.a.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/ssh.add.a.plist
