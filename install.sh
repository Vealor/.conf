#!/bin/sh
# set -ex

# install brew if not there
if ! type brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
# install oh-my-zsh if not there
if test -z "$ZSH"; then
  brew install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# do stow
if [[ $PWD/ != *\.conf/ ]]; then
  cd ~/.conf
fi
if ! type stow &> /dev/null; then
  brew install stow
fi
stow git tmux vim zsh

# all brew installs from Brewfile
brew bundle install

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
nvm install --lts

# install oh-my-zsh plugins
ZSH_BASE_FOLDER=$HOME/.oh-my-zsh/custom/plugins
if [ ! -d "$ZSH_BASE_FOLDER/k" ] ; then git clone https://github.com/supercrabtree/k $ZSH_BASE_FOLDER/k; fi
if [ ! -d "$ZSH_BASE_FOLDER/alias-tips" ] ; then git clone https://github.com/djui/alias-tips.git $ZSH_BASE_FOLDER/alias-tips; fi
if [ ! -d "$ZSH_BASE_FOLDER/zsh-completions" ] ; then git clone https://github.com/zsh-users/zsh-completions $ZSH_BASE_FOLDER/zsh-completions; fi
if [ ! -d "$ZSH_BASE_FOLDER/zsh-syntax-highlighting" ] ; then git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_BASE_FOLDER/zsh-syntax-highlighting; fi
if [ ! -d "$ZSH_BASE_FOLDER/zsh-autosuggestions" ] ; then git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_BASE_FOLDER/zsh-autosuggestions; fi


echo '== SYS   UPDATE ==' && softwareupdate -l
echo '== BREW  UPDATE ==' && brew update
echo '== BREW UPGRADE ==' && brew upgrade
