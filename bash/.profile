if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty2 ]]; then
  export XKB_DEFAULT_LAYOUT=us
  export XKB_DEFAULT_MODEL=chromebook
  export XKB_DEFAULT_VARIANT=altgr-intl
  export XKB_DEFAULT_OPTIONS=caps:super,nodeadkeys
  #LD_PRELOAD=/usr/lib/libwlc-wall-injector.so
  #exec sway
fi

# Ugly fix for xfce4-terminal which won't allow anything othern than setting
# xterm
if [ "$COLORTERM" == "xfce4-terminal" ]; then
  export TERM=xterm-256color
  tput init
fi

if [ "$TERM" == "xterm-termite" ]; then
  export TERM=xterm-256color
  tput init
fi

# Default programs
export EDITOR=kak
export VISUAL=kak
export BROWSER=firefox
export TERMINAL=termite

# Shell colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/npm-global/bin:$PATH

# Yarn global bin
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# For macOS
if which brew >/dev/null 2>&1; then
  # Cabal
  export PATH=$HOME/.cabal/bin:$PATH

  # Brew sbin
  export PATH=/usr/local/sbin:$PATH

  # Use SQLite supplied by brew
  export PATH="$(brew --prefix sqlite3)/bin:$PATH"
  # Gems
  #export PATH="$(brew --prefix ruby)/bin:$PATH"
fi

# Scala JVM options
export SBT_OPTS='-Xmx1024M'
# Java JVM options
export JAVA_OPTS='-Xms256M -Xmx1024M'
# Maven options
export MAVEN_OPTS="$JAVA_OPTS"

# Maildir
export MAILDIR=$HOME/mail

# Muil
export MUIL_EMAIL
export MUIL_EDITOR='nvim - "+set ft=mail bt=nofile"'

export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=ctags
# Enable global/gtags for less
export LESSGLOBALTAGS=global
# Colored man pages: http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# SET UP FOR GPG-AGENT
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye >/dev/null

if [ -e /home/icetan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/icetan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

NIX_PATH="ssh-config-file=$HOME/.ssh/config:$NIX_PATH"
NIX_PATH="ssh-auth-sock=$SSH_AUTH_SOCK:$NIX_PATH"

. $HOME/.local/profile
