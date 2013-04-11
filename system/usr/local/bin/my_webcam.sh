#!/bin/bash

# Tempo
TKEY=100
TCAM=4

ip addr | grep 192.168.253  > /dev/null 2>&1
if [ $? -eq 1 ]; then
    IP="10.0.0.33"
else
    IP="192.168.253.9"
fi

webcam () {
    vlc --no-audio http://$IP:$1&
    sleep $TCAM
    xdotool key --delay $TKEY ctrl+h 
}

# Lancement d'un terminal avec glances
xdotool key --delay $TKEY super+Return
xdotool type "glances"
xdotool key --delay $TKEY Return

# Lancement des webcams
xdotool key --delay $TKEY super+h
webcam 8081
xdotool key --delay $TKEY super+v
webcam 8082
webcam 8083
xdotool key --delay $TKEY super+r Left Left Escape

