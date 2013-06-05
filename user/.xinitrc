#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Fonts
xset +fp /usr/share/fonts/local
xset fp rehash


DEFAULT_SESSION=i3
case $1 in
  kde)
    exec startkde
    ;;
  i3)
    exec i3 -V >> /tmp/i3log 2>&1
    ;;
  *)
    #udiskie &
    exec dbus-launch --exit-with-session  $DEFAULT_SESSION &
    ;;
esac

wait $wmpid
