if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

PS1='\h:\w$(__git_ps1 " (⎇ %s)")\$ '

source ~/.profile
