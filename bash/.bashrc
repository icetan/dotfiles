test -f ~/.profile && . ~/.profile

# SET UP FOR GPG-AGENT
export GPG_TTY=$(tty)
#gpg-connect-agent updatestartuptty /bye >/dev/null

# Ugly fix for xfce4-terminal which won't allow anything othern than setting
# xterm
if [ "$COLORTERM" == "xfce4-terminal" ]; then
  export TERM=xterm-256color
fi

if [ "$TERM" == "xterm-termite" ]; then
  export TERM=xterm-256color
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

PS1="\[\e[30m\]\h \[\e[0m\]\w"

test -f /usr/share/git/completion/git-prompt.sh && {
  . /usr/share/git/completion/git-prompt.sh
  _git_prompt() {
    local git_status="$(__git_ps1 '%s' | sed 's/\(.*\) /\1/')"
    if [ "$git_status" ]; then
      if ( echo "$git_status" | grep -q '[\+\*]%\?$' ); then
          echo -en $'\001\e[31m\002'
      elif ( echo "$git_status" | grep -q '%$' ); then
          echo -en $'\001\e[33m\002'
      else
          echo -en $'\001\e[32m\002'
      fi
      echo -n " $git_status"
      echo -en $'\001\e[0m\002'
    fi
  }

  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true

  PS1="$PS1\$(_git_prompt)"
}

PS1="$PS1\[\e[0;37m\]\$\[\e[0m\] "

test -f ~/.bashrc.local && . ~/.bashrc.local
test -f ~/.bash_aliases && . ~/.bash_aliases
