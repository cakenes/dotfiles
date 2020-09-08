#!/bin/bash

sleep 0.5
focus=$(xdotool getwindowfocus getwindowname)
if [[ $focus != "Path of Exile" ]]; then
  exit 1
fi
xdotool key "Return"
xdotool type "/hideout"
xdotool key "Return"
