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

alias emacs='TERM=xterm emacs'

alias git-rm-branches='git branch -r --merged master | sed -n "s!^ *origin/!!;/^SEAL-/p" | xargs -n1 -I% git push origin :%'

# Git
git-rs() {
  find ${*-*} -maxdepth 0 -type d -exec test -d {}/.git \; -and -exec echo -e "\e[32m{}:\e[0m" \; -exec git -C {} ${cmd-s -uno} \;
}

git-rc() {
  find * -maxdepth 0 -type d -exec test -d {}/.git \; -and -exec echo -e "\e[32m{}:\e[0m" \; -exec git -C {} ${*-s -uno} \;
}

rc() {
  find * -maxdepth 0 -type d -exec echo -e "\e[32m{}:\e[0m" \; -exec ${*-true} \; -exec echo \;
}

# Nix
alias ns='nix-shell -p'

alias isodate="date +%Y-%m-%d"
alias kagenda='watch -n 60 -ct "khal --color list --format \"\$KHAL_FORMAT\" today 20 days"'

alias httpserve="python2 -m SimpleHTTPServer 8000"

alias clippy="cowsay -W80 -f ~/clippy.cow"
