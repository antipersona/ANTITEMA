#!/bin/bash

entries=" Logout\n Suspend\n Reboot\n Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 245 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    exec loginctl terminate-session $XDG_SESSION_ID;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
