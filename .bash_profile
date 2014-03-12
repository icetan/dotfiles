PS1='\e[1;30m\h \e[0m\w'

function _git_prompt() {
  local git_status="$(__git_ps1 '%s' | sed 's/\(.*\) /\1/')"
  if [ "$git_status" ]; then
    if ( echo "$git_status" | grep -q '[\+\*]%\?$' ); then
        local color=$'\e[31m'
    elif ( echo "$git_status" | grep -q '%$' ); then
        local color=$'\e[33m'
    else
        local color=$'\e[32m'
    fi
    echo -n $color "⎇ $git_status"$'\e[0m'
  fi
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true

  PS1="$PS1"'$(_git_prompt)'
fi

PS1="$PS1"'\e[0;37m\$\e[0m '

source ~/.profile
