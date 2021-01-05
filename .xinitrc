#!/bin/bash

sxhkd &
picom &
numlockx on &
xset r rate 300 50
xset -dpms
xset s off
bash ~/.scripts/keyboardDetection.sh
#bash ~/Tools/searx-docker/start.sh &
sleep 0.1s && xmodmap ~/.Xmodmap &
xrandr --output eDP-1 --primary --mode 1366x768 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal &
sleep 0.1s && feh --bg-fill .config/wall.png &

while true; do
    SPOTIFY_SONG=$(spotify-now -i "%artist - %title")
    SONG=$(mpc current)
    #BATT=$(acpi -b | awk '{ print $4 }' | sed 's/,//')
    DATE=$(date +"%d/%m/%Y")
    HOUR=$(date +"%R")
    MEM=$(free -h  | grep Mem | awk '{ print $NF }')
    WIFI_SIGNAL=$(cat /proc/net/wireless | awk 'NR==3 { print $4 }' | sed 's/\.//')
    SSID=$(iwgetid | cut -d ':' -f2 | sed "s/\"//g")
    VOLUME=$(amixer get Master | awk 'NR==5 { print $4 }' | sed 's/\[//;s/\]//')

    #if [[ $SPOTIFY_SONG =~ "Ad" ]];then
    #    xsetroot -name " : $SSID | MEM: $MEM | : $VOLUME | : $DATE | [ $HOUR ] "
    #    sleep 1s
    #else 
    #    xsetroot -name " : $SONG | : $SSID | MEM: $MEM | : $VOLUME | : $DATE | [ $HOUR ] "
    #    sleep 1s
    #fi
    if [ -z "$SONG" ];then
        xsetroot -name " : $SSID $WIFI_SIGNAL | MEM: $MEM | : $VOLUME | : $DATE | [ $HOUR ] "
    else
        xsetroot -name " : $SONG | : $SSID $WIFI_SIGNAL | MEM: $MEM | : $VOLUME | : $DATE | [ $HOUR ] "
    fi

done &
exec dwm
