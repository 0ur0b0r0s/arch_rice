#!/bin/bash

sxhkd &
picom &
numlockx on &
xset r rate 300 50
xset -dpms
xset s off
bash ~/.scripts/keyboardDetection.sh &
bash ~/.scripts/screen_config.sh &
sleep 0.1s && xmodmap ~/.Xmodmap &
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
        xsetroot -name " WIFI: $SSID $WIFI_SIGNAL | MEM: $MEM | VOL: $VOLUME | $DATE | [ $HOUR ] "
    else
        xsetroot -name " WIFI: $SSID $WIFI_SIGNAL | MEM: $MEM | VOL: $VOLUME | $DATE | [ $HOUR ] "
    fi

done &
exec dwm
