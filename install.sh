#!/bin/sh

sudo apt update
sudo apt dist-upgrade -y

# installs
sudo apt -y build-essential \
            curl \
            libbz2-dev \
            libffi-dev \
            liblzma-dev \
            libncursesw5-dev \
            libreadline-dev \
            libsqlite3-dev \
            libssl-dev \
            libxml2-dev \
            libxmlsec1-dev \
            llvm \
            make \
            tk-dev \
            wget \
            xz-utils \
            zlib1g-dev \
            \
            stow \
            vim \
            feh \
            git \
            ssh \
            vlc \
            mpv \
            gparted \
            tmux \
            tree \
            nmap \
            netcat \
            whois \
            meld \
            moc \
            xdotool

# install oh-my-zsh if not there
if test -z "$ZSH"; then
  sudo apt install -y zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# do stow
cd ~/.conf
stow --verbose=5 git moc tmux vim zsh

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
source ~/.bashrc
source ~/.zshrc
nvm install --lts
nvm use --lts
npm install -g npm

# install python
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.12.0
pyenv global 3.12.0

# install oh-my-zsh plugins
ZSH_BASE_FOLDER=$HOME/.oh-my-zsh/custom/plugins
if [ ! -d "$ZSH_BASE_FOLDER/k" ] ; then git clone https://github.com/supercrabtree/k $ZSH_BASE_FOLDER/k; fi
if [ ! -d "$ZSH_BASE_FOLDER/alias-tips" ] ; then git clone https://github.com/djui/alias-tips.git $ZSH_BASE_FOLDER/alias-tips; fi
if [ ! -d "$ZSH_BASE_FOLDER/zsh-completions" ] ; then git clone https://github.com/zsh-users/zsh-completions $ZSH_BASE_FOLDER/zsh-completions; fi
if [ ! -d "$ZSH_BASE_FOLDER/zsh-syntax-highlighting" ] ; then git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_BASE_FOLDER/zsh-syntax-highlighting; fi
if [ ! -d "$ZSH_BASE_FOLDER/zsh-autosuggestions" ] ; then git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_BASE_FOLDER/zsh-autosuggestions; fi
