# Locale
#export LC_ALL=en_US.UTF-8

# Default programs
export EDITOR=kak
export VISUAL=kak
export BROWSER=firefox
export TERMINAL=termite

# Shell colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export PATH=$HOME/.local/bin:$PATH
#export PATH=$HOME/src/pairon-stable:$PATH

# Yarn global bin
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#if [ -n "$DESKTOP_SESSION" ];then
#    eval $(gnome-keyring-daemon --start)
#    export SSH_AUTH_SOCK
#fi

#if which brew &>/dev/null; then
#  # Cabal
#  export PATH=$HOME/.cabal/bin:$PATH
#
#  # Brew sbin
#  export PATH=/usr/local/sbin:$PATH
#
#  # Use SQLite supplied by brew
#  export PATH="$(brew --prefix sqlite3)/bin:$PATH"
#  # Gems
#  #export PATH="$(brew --prefix ruby)/bin:$PATH"
#fi

#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
#export PATH="$JAVA_HOME:$PATH"

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
export LESS_TERMCAP_us=$'\E[04;38;5;146M' # BEGIN UNDERLINE

export KHAL_FORMAT="{start-end-time-style}{repeat-symbol}  {title} @ {location}{description-separator}{description}"

if [ -e /home/icetan/.nix-profile/etc/profile.d/nix.sh ]; then . /home/icetan/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# SET UP SSH AGENT USING GPG
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

test -f $HOME/.profile.local && . $HOME/.profile.local
