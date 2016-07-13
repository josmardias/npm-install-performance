#!/usr/bin/env bash

# Loads NVM (node version manager)
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

test_node_version () {
  echo

  rm -rf node_modules

  nvm use $1
  npm cache clean

  time (
    npm install --production > /dev/null 2>&1
    echo
    echo "npm returned $?"
  )

  du -smh node_modules
}

test_node_version "v0.12"
test_node_version "v4"
test_node_version "v6"
