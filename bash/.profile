# Locale
export LC_ALL=en_US.UTF-8

# Vim for editor
export EDITOR=vim

# Shell colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Cabal
export PATH=$HOME/.cabal/bin:$PATH

if [ $(which brew) ]; then
  # Use SQLite supplied by brew
  export PATH="$(brew --prefix sqlite3)/bin:$PATH"
fi

# Scala JVM params
export SBT_OPTS="\
  -Xmx1024m\
  -XX:MaxPermSize=256m\
"

# Maildir
export MAILDIR=$HOME/.mail

# Muil
export MUIL_EMAIL=
export MUIL_EDITOR='vim - "+set ft=mail bt=nofile"'

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

. $HOME/.profile.local
