#!/bin/bash

[[ "$OSTYPE" =~ ^darwin ]] || exit 0

which -s brew > /dev/null
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

brew bundle -v --file=${DIR}/Brewfile
