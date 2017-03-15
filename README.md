# dotzero dotfiles

## Installation

1. [Install Xcode Command Line Tools](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/).
2. [Generate SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).
3. [Install Homebrew](https://brew.sh/).
4. [Install ZSH](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH).
5. [Install Oh My Zsh](http://ohmyz.sh/).

Then run these commands in the terminal:

```bash
brew install git
git clone git@github.com:dotzero/dotfiles.git ~/.0
cd ~/.0
python sync.py
bash .macos
```

## Updating

```bash
selfupdate
```
