dotfiles = $(abspath $(filter-out %. %..,$(wildcard $@/.*)))

objects = bash bash-alias git vim

bash:
	ln -sf $(dotfiles) ~
	ln -sf ~/.bashrc ~/.bash_profile
	touch ~/.profile
	touch ~/.alias

bash-alias:
	ln -sf $(dotfiles) ~

git:
	ln -sf $(dotfiles) ~
	touch ~/.gitconfig_user

vim:
	ln -sf $(dotfiles) ~
	mkdir -p ~/.vimundo

install: $(objects)

.PHONY: install $(objects)
