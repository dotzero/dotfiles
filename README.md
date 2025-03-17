# dotzero dotfiles

### Set computer name

```bash
sudo scutil --set ComputerName "0x6D746873"
sudo scutil --set HostName "0x6D746873"
sudo scutil --set LocalHostName "0x6D746873"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"
```

### Generating a new SSH key

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
nano ~/.ssh/config
```

Add the following lines:

```
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_ed25519
```

### Install dotfiles

```bash
git clone git@github.com:dotzero/dotfiles.git ~/.0
```

### Bootstrap dotfiles

```bash
~/.0/bootstrap
~/.0/macos
```

### Update

```bash
selfupdate
```
