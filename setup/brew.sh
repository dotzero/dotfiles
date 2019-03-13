#!/bin/bash

[[ "$OSTYPE" =~ ^darwin ]] || exit 0

which -s brew > /dev/null
if [[ $? != 0 ]] ; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
