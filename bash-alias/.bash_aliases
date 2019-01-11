#!/bin/bash

docker-exec() {
  local name=$1; shift
  docker exec -i`test -s /dev/stdin || echo t` $(docker ps -q -f name="$name") bash -c "export TERM=$TERM;$*"
}

watch-log2() {
  (
    master_pid=$BASHPID
    cat | { $1 && kill $master_pid; } &
    pid=$!; sleep $2; kill $pid 2>&-; exit 0
  )
}

waitfor() {
  (
    sleep $2 & sleep_pid=$!
    cat | { $1; es=$?; kill $sleep_pid 2>&-; exit $es; } & pid=$!
    wait $sleep_pid; kill `jobs -p` 2>&-
    wait $pid
  )
}

install-vim-spell() {
  curl -l 'ftp://ftp.vim.org/pub/vim/runtime/spell/' | grep -E "^($1)\." | xargs -I% curl ftp://ftp.vim.org/pub/vim/runtime/spell/%  -o ~/.config/nvim/spell/%
}

alias git-rm-branches='git branch -r --merged master | sed -n "s!^ *origin/!!;/^SEAL-/p" | xargs -n1 -I% git push origin :%'

# Git
git-rs() {
  find ${*-*} -maxdepth 0 -type d -exec test -e {}/.git \; -and -exec echo -e "\e[32m{}:\e[0m" \; -exec git -C {} ${cmd-s -uno} \;
}

git-rc() {
  find * -maxdepth 0 -type d -exec test -e {}/.git \; -and -exec echo -e "\e[32m{}:\e[0m" \; -exec git -C {} ${@-s -uno} \;
}

rc() {
  find * -maxdepth 0 -type d -exec echo -e "\e[32m{}:\e[0m" \; -exec ${@-true} \; -exec echo \;
}

# Nix
alias ns='nix-shell -p'

alias isodate="date +%Y-%m-%d"

alias httpserve="python2 -m SimpleHTTPServer 8000"

alias qr="qrencode -t UTF8"

alias linebuf="stdbuf -oL -eL"

ssh-tmux() {
  local host="$1";shift
  ssh "$host" -t bash -l "tmux $@"
}

ssh-tmux-a() {
  ssh-tmux "$1" a -d -t "$2"
}

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias fixit='sudo rm -f /var/lib/pacman/db.lck'
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
