#!/bin/sh
set -ex
if [[ $PWD/ != *\.conf/ ]]; then
  cd ~/.conf
fi
if ! type stow &> /dev/null; then
  brew install stow
fi
stow git tmux vim zsh
