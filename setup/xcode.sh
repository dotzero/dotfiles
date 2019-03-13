#!/bin/bash

[[ "$OSTYPE" =~ ^darwin ]] || exit 0

xcode-select -p > /dev/null
if [[ $? != 0 ]] ; then
  xcode-select --install
fi
