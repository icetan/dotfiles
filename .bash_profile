if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

PS1='\h:\w\[\e[0;32m\]$(__git_ps1 " ⎇ %s")\[\e[0m\]\[\e[0;37m\]\$\[\e[0m\] '

source ~/.profile
