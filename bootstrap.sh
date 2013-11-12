#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
    --exclude "README.md" --exclude "LICENSE-MIT" -av --no-perms . ~
  source ~/.zshrc
}

if [ "$1" = "--force" -o "$1" = "-f" ]; then
  doIt
else
  read "?This may overwrite existing files in your home directory. Are you sure? (y/n) "
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi

unset doIt
