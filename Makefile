dotfiles = $(abspath $(filter-out %. %..,$(wildcard $@/.*)))

objects = bash bash-alias git vim tmux

ifdef link
cp_cmd = -ln -s
else
cp_cmd = -cp
endif

# TODO: backup existing config files instead of overwriting or using
# interactive mode.

ifdef force
cp_flags = -f
else
cp_flags = -i
endif

cp_cmd += $(cp_flags)


all: $(objects)

bash:
	$(cp_cmd) $(dotfiles) ~
	-rm $(cp_flags) ~/.bash_profile
	touch ~/.bashrc.local
	touch ~/.profile
	touch ~/.alias

bash-alias:
	$(cp_cmd) $(dotfiles) ~
	touch ~/.alias.local

git:
	$(cp_cmd) $(dotfiles) ~
	touch ~/.gitconfig.local

vim:
	$(cp_cmd) $(dotfiles) ~
	mkdir -p ~/.vimundo
	touch ~/.vimrc.local

tmux:
	$(cp_cmd) $(dotfiles) ~
	touch ~/.tmux.conf.local

.PHONY: all $(objects)
