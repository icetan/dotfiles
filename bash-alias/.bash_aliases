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

# Git

git-merged-remote() {
  local branch=${1:-master}
  local remote=${2:-origin}
  git branch -r --merged $remote/$branch \
      | sed -n "s|^ *$remote/\([^ ]*\)$|$remote \1|p" \
      | grep -v "^$remote $branch$"
}
git-merged() {
  local branch=${1:-master}
  git branch --merged $branch | tr -d ' ' | grep -v "^$branch$"
}

git-rs() {
  find ${*-*} -maxdepth 0 -type d -exec test -d {}/.git \; -and -exec echo -e "\e[32m{}:\e[0m" \; -exec git -C {} ${cmd-s -uno} \;
}

git-rc() {
  find * -maxdepth 0 -type d -exec test -d {}/.git \; -and -exec echo -e "\e[32m{}:\e[0m" \; -exec git -C {} ${@-s -uno} \;
}

rc() {
  find * -maxdepth 0 -type d -exec echo -e "\e[32m{}:\e[0m" \; -exec ${@-true} \; -exec echo \;
}

# Nix
alias ns='nix-shell -p'

alias isodate="date +%Y-%m-%d"

alias httpserve="python2 -m SimpleHTTPServer 8000"

alias clippy="cowsay -W80 -f ~/clippy.cow"

alias qr="qrencode -t UTF8"

alias linebuf="stdbuf -oL -eL"

ssh-tmux() {
  local host="$1";shift
  ssh "$host" gpgconf --kill all
  ssh "$host" -t bash -l "tmux $@"
}

ssh-tmux-a() {
  ssh-tmux "$1" a -d -t "$2"
}

alias ovpn='sudo openvpn --script-security 2 --up ~/src/openvpn-update-resolv-conf/update-resolv-conf.sh --down ~/src/openvpn-update-resolv-conf/update-resolv-conf.sh --config'

[ -f ~/.local/bash_aliases ] && . ~/.local/bash_aliases
