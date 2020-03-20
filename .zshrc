#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
setxkbmap -option caps:escape

fpath+=~/.zfunc

source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PYTHON_ICON=''

POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='blue'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='gray'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='white'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='cyan'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

DEFAULT_USER="chochoe"
KEYTIMEOUT=1

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PIP_DOWNLOAD_CACHE=$HOME/.pip-download-cache

export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python"
export WORKON_HOME=~/.virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
source /usr/bin/virtualenvwrapper_lazy.sh
if [ -n "$VIRTUAL_ENV" ]; then
    . "$VIRTUAL_ENV/bin/activate"
else
    workon default
fi

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/.rbenv/shims"

export EDITOR=nvim
export VISUAL=nvim

alias ls='exa'
alias gotidy='go mod tidy'
alias gst='git status'
alias be='bundle exec'
alias vi='nvim'
alias k='kubectl'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $HOME/.cargo/env
source $HOME/.rbenv/completions/rbenv.zsh

source <(kubectl completion zsh)
source $HOME/.mix_autocomplete.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
