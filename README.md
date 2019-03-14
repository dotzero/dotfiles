# dotzero dotfiles

## Install

```bash
git clone git@github.com:dotzero/dotfiles.git ~/.0
~/.0/homebrew/brew.sh
~/.0/homebrew/ohmyz.sh
~/.0/homebrew/sync.py
```

## Update

```bash
selfupdate
```

### Visual Studio Code

```bash
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
rm -rf ~/Library/Application\ Support/Code/User
ln -s ~/Dropbox/sync/Code/User ~/Library/Application\ Support/Code
```
