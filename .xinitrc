#!/bin/bash

sxhkd &
picom &
numlockx on &
xset r rate 300 50
xset -dpms
xset s off
setxkbmap -layout br &
#bash ~/Tools/searx-docker/start.sh &
sleep 0.1s && xmodmap ~/.Xmodmap &
feh --bg-fill .config/wall.png &

while true; do
    SONG=$(spotify-now -i "%artist - %title")
    #BATT=$(acpi -b | awk '{ print $4 }' | sed 's/,//')
    DATE=$(date +"%d/%m/%Y")
    HOUR=$(date +"%R")
    MEM=$(free -h  | grep Mem | awk '{ print $NF }')
    SSID=$(iwgetid | cut -d ':' -f2 | sed "s/\"//g")
    VOLUME=$(amixer get Master | awk 'NR==5 { print $4 }' | sed 's/\[//;s/\]//')

    if [[ $SONG =~ "Ad" ]];then
        xsetroot -name " : $SSID | MEM: $MEM | : $VOLUME | : $DATE | [ $HOUR ] "
        sleep 1s
    else 
        xsetroot -name " : $SONG | : $SSID | MEM: $MEM | : $VOLUME | : $DATE | [ $HOUR ] "
        sleep 1s
    fi
done &
exec dwm
