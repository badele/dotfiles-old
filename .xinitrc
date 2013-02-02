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
xset +fp /usr/share/fonts/local
xset fp rehash


DEFAULT_SESSION=i3
case $1 in
  kde)
    exec startkde
    ;;
  wmfs)
    #exec ck-launch-session dbus-launch wmfs & wmpid=$!
    exec dbus-launch --exit-with-session dbus-launch wmfs & wmpid=$!
    #feh --bg-fill ~/wallpaper-933751.jpg
    chromium &
    xchat &
    gvim &
    #xdotool mousemove_relative 200 0
    #sleep $TEMPO
    #xterm  -fg white -bg black -e tty-clock -s &
    #sleep $TEMPO
    #xdotool mousemove_relative 0 200
    #xterm   -fg white -bg black &
    synclient touchpadoff=1
    ;;
  i3)
    exec i3 -V >> /tmp/i3log 2>&1
    ;;
  *)
    udiskie &
    exec dbus-launch --exit-with-session  $DEFAULT_SESSION &
    ;;
esac

wait $wmpid
