test -f ~/.profile && . ~/.profile

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
elif [ -f /usr/share/bash_completion ]; then
  . /usr/share/bash_completion
elif [ -f ~/.nix-profile/share/bash-completion/bash_completion ]; then
  . ~/.nix-profile/share/bash-completion/bash_completion
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

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
#export BROWSER=/usr/bin/palemoon

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -hl --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -hla --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
#alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck'
alias update='yaourt -Syua'
alias con='nano $HOME/.i3/config'
alias comp='nano $HOME/.config/compton.conf'
alias inst='sudo pacman -S'
alias mirrors='sudo pacman-mirrors -g'
alias db='sudo pacman -Syy'
alias printer='system-config-printer'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#if [ ! "$SSH_AUTH_SOCK" ]; then
#  eval `ssh-agent`
#  export SSH_AUTH_SOCK
#fi

# prompt
#PS1='[\u@\h \W]\$ '

PS1="\[\e[1;30m\]\h \[\e[0m\]\w"

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

. ~/.bash_aliases
. ~/.bashrc.local
#if [ -e /home/icetan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/icetan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# OPAM configuration
. /home/icetan/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
