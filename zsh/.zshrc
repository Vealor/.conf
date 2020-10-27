#
# ~/.zshrc
################################################################################
### DEFAULT SOURCED
export ZSH=$HOME/.oh-my-zsh
# Source global definitions
if [ -f /etc/zshrc ]; then
	 . /etc/zshrc
fi

ZSH_THEME="af-magic"
plugins=(git tig docker docker-compose golang pip)
plugins+=( history history-substring-search httpie sudo postgres )
plugins+=( osx lein node npm jump gulp mosh )
plugins+=( k z )
plugins+=( alias-tips )
plugins+=( zsh-completions zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

# autocompletions
zmodload zsh/complist
autoload -Uz compinit
compinit -D
# load bashcompinit for some old bash completions
autoload bashcompinit && bashcompinit
# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

################################################################################
### QoL
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
PROMPT_COMMAND='history -a'
# Expand history size
export HISTFILESIZE=10000
export HISTSIZE=10000
export SAVEHIST=10000
export HISTTIMEFORMAT="%F %T "
# Set the default editor
export EDITOR='vim'
export VISUAL='vim'
alias history="history 1"
# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
################################################################################
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
################################################################################
### Default Aliases
# some more basic ls aliases
alias ls='ls -GFh'
alias ll='ls -alhFG'
alias la='ls -AG'
alias l='ls -CFG'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

################################################################################
### Python (pyenv)
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Alias definitions
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi
# Function definitions
if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi
# System specfic modifications
if [ -f ~/.zsh_sysspec ]; then
    . ~/.zsh_sysspec
fi

################################################################################
### App-specific intialization
eval $(thefuck --alias)
