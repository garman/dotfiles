function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

PROMPT='%{$FG[040]%}%n%{$reset_color%}%{$FG[239]%}:%{$reset_color%}%{$FG[033]%}$(box_name)
╰─\%{$fg_bold[red]%}%c%{$reset_color%}:%{$fg[cyan]%}$(git_prompt_info)%{$reset_color%}:%# '

RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
