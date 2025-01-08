export ZSH="$HOME/.oh-my-zsh"

export VISUAL=nvim
export EDITOR="$VISUAL"
export PAGE=""
export TERM="xterm-256color"

ZSH_THEME=""

# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

plugins=(git)

if [[ -z "$CODESPACES" ]]
then
  export PATH="$HOMEBREW_PREFIX/opt/libpq/bin:$PATH"
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
  fpath+=($HOME/.zsh/pure)
fi

source $ZSH/oh-my-zsh.sh
source ~/.fzf.bash

autoload -U promptinit; promptinit
prompt pure

# system
alias ls='ls -lG'
alias lsa='ls -lGa'
alias psgrep="ps aux | grep"

# git
alias g="git"

alias gsl="g status"
alias gs="g st"
alias gsr="g status -vv -s | cut -c4- | xargs rubocop"
alias ga="g add ."
alias gaa="g add --all"
alias lg="g lg"
alias gco="g co"
alias gb="g co -b"
alias gc="g c -v"
alias gcm="g co master"
alias gcma="g co main"
alias gpom="g pull origin master"
alias gpomain="g pull origin main"
alias gfo="g fetch origin"
alias gss="g stash save"
alias gsp="g stash pop"
alias gcsv="g commit -S -v"
alias gcsa="g commit -S --amend"
alias branch="g branch --sort=-committerdate"

# rails
alias rake="bin/rake"
alias br="bin/rails"
alias rc="br console"
alias rt="br test"

alias dbm="rake db:migrate db:test:prepare"

alias be="bundle exec"
alias bi="bundle install"
alias btc="bin/rails test_changes"

alias ss="script/server"

# Tmux
alias t="tmux"
alias tn="t new -t"
alias ta="t attach -t"

if which rbenv >/dev/null; then
  eval "$(rbenv init - zsh)"
fi

if which nodenv >/dev/null; then
  eval "$(nodenv init -)"
fi
