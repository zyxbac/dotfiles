dotfiles
========

Collection of various config files

After cloning this repo, run `install` to automatically set up the development
environment. Note that the install script is idempotent: it can safely be run
multiple times.

For the color scheme to look right, you will also need terminal-specific
support. The configuration for that, along with a whole bunch of other
machine-specific configuration, is located in [dotfiles-local][dotfiles-local].

Dotfiles uses [Dotbot][dotbot] for installation.

Making Local Customizations
---------------------------

You can make local customizations for some programs by editing these files:

* `vim` : `~/.vimrc_local`
* `bash` : `~/.shell_local_before` run first
* `bash` : `~/.shell_local_after` run last
* `git` : `~/.gitconfig_local`
* `tmux` : `~/.tmux_local.conf`

