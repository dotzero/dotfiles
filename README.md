# dotzero dotfiles

## First

1. [Install iTerm2](https://www.iterm2.com/)
2. `xcode-select --install`
3. [Generate SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).
4. [Install Homebrew](https://brew.sh/).
5. [Install Oh My Zsh](http://ohmyz.sh/).

## Second

```bash
git clone git@github.com:dotzero/dotfiles.git ~/.0
cd ~/.0
brew tap homebrew/bundle
brew bundle -v
python sync.py
bash .macos
```

# Visual Studio Code

```bash
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
rm -rf ~/Library/Application\ Support/Code/User
ln -s ~/Dropbox/sync/Code/User ~/Library/Application\ Support/Code
```

## Updating

```bash
selfupdate
```
