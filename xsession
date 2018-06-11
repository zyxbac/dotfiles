#!/bin/sh
#
## ~/.xsession
#
## Executed by xdm (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		if [ -x "$f" ]; then
			# shellcheck source=/dev/null
			. "$f"
		fi
	done
	unset f
fi

# run Xprofile
if [ -f ~/.Xprofile ]; then
	# shellcheck source=/dev/null
	. ~/.Xprofile
fi

# run Xmodmap
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap

# run local xhost
xhost local:root

xidle -delay 5 -sw -timeout 300 -program "/usr/X11R6/bin/xlock -mode blank" &
xconsole -geometry -0+15 -fn 5x7 &
xstatbar -T -w 1366 &
sh ~/.fehbg &
xterm &

# start the wm
cwm

