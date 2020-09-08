#!/bin/bash

timer=4.3

for pid in $(pidof -x poe-flask.sh); do
  if [ $pid != $$ ]; then
    killall poe-flask.sh
    exit 1
  fi
done

while :
do
  sleep 0.5
  focus=$(xdotool getwindowfocus getwindowname)
  if [[ $focus != "Path of Exile" ]]; then
    continue
  fi
#  xdotool key "1"
  xdotool key "2"
  xdotool key "3"
  xdotool key "4"
  xdotool key "5"
  sleep $timer
done
