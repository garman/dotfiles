git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export EDITOR=vim

# system
alias ls='ls -lG'
alias lsa='ls -lGa'
alias psgrep="ps aux | grep"

# git
alias gs="git status"
alias ga="git add ."
alias gaa="git add --all"
alias lg="git lg"
alias gco="git co"
alias gb="git co -b"
alias gc="git c -v"
alias gcm="git co master"
alias gcma="git co main"
alias gpom="git pull origin master"
alias gpomain="git pull origin main"
alias gfo="git fetch origin"
alias gss="git stash save"
alias gsp="git stash pop"
alias gcsv="git commit -S -v"
alias gcsa="git commit -S --amend"
alias branch="git branch --sort=-committerdate"

# rails
alias rake="bin/rake"
alias be="bundle exec"
alias bi="bundle install"
alias rs="bin/server"
alias ss="script/server"
alias rc="bin/console"
alias bt="bin/rails test"
alias btc="bin/rails test_changes"
alias rspec="bin/rspec"
alias dbm="bin/rake db:migrate db:test:prepare"
