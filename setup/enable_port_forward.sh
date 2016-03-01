# ----------------------
# Copy port forward settings.
# ----------------------
sudo cp -v ./ipfw.conf /etc/ipfw.conf

# ----------------------
# setup and launching daemon
# ----------------------
sudo cp -v ./org.dmuth.ipfw.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/org.dmuth.ipfw.plist
