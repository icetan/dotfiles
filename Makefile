dotfiles = $(abspath $(filter-out %. %..,$(wildcard $@/.*)))

objects = bash bash-alias git vim tmux


all: $(objects)

bash:
	ln -sf $(dotfiles) ~
	ln -sf ~/.bashrc ~/.bash_profile
	touch ~/.bashrc.local
	touch ~/.profile
	touch ~/.alias

bash-alias:
	ln -sf $(dotfiles) ~
	touch ~/.alias.local

git:
	ln -sf $(dotfiles) ~
	touch ~/.gitconfig.local

vim:
	ln -sf $(dotfiles) ~
	mkdir -p ~/.vimundo
	touch ~/.vimrc.local

tmux:
	ln -sf $(dotfiles) ~
	touch ~/.tmux.conf.local

.PHONY: all $(objects)
