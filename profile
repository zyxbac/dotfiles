# $OpenBSD: dot.profile,v 1.4 2005/02/16 06:56:57 matthieu Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:$HOME/.dotfiles/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

HISTFILE=$HOME/.sh_history

ENV=$HOME/.kshrc

#EMAIL
GPGKEY=0x7B8264E9129E4672

export PATH HOME TERM HISTFILE ENV GPGKEY
