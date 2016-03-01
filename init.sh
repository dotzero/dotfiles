#!/bin/bash

# Current working directory
LOCATION="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

declare -a DEFAULTS=(
  'default.ackrc'
  'default.gitconfig'
  'default.gitignore_global'
  'default.zshrc'
)

for FILE in "${DEFAULTS[@]}"; do
  DESC=$(echo $FILE | cut -d'.' -f 2)
  cp -vf $LOCATION/$FILE ~/.$DESC
done
