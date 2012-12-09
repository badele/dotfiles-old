#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#  for f in /etc/X11/xinit/xinitrc.d/*; do
#    [ -x "$f" ] && . "$f"
#  done
#  unset f
#fi


TEMPO=0.5

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Fonts
20 xset +fp /usr/share/fonts/local
21 xset fp rehash


DEFAULT_SESSION=startkde
case $1 in
kde)
	exec startkde
	;;
wmfs)
	#exec ck-launch-session dbus-launch wmfs & wmpid=$!
	dbus-launch wmfs & wmpid=$!
	feh --bg-fill ~/wallpaper-933751.jpg
	chromium &
	xterm -fg white -bg black -e weechat-curses &
	xdotool mousemove_relative 200 0
	sleep $TEMPO
	xterm  -fg white -bg black -e tty-clock -s &
	sleep $TEMPO
	xdotool mousemove_relative 0 200
	xterm   -fg white -bg black &
	synclient touchpadoff=1
	;;
*)
	exec dbus-launch $DEFAULT_SESSION &
	;;
esac

wait $wmpid
