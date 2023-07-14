#!/bin/bash

sxhkd &
picom &
numlockx on &
xset r rate 300 50
xset -dpms
xset s off
dash ~/.scripts/keyboardDetection.sh &
sleep 0.1s && feh --bg-fill ~/.config/wall.png &
while true; do
    SPOTIFY_SONG=$(spotify-now -i "%artist - %title")
    SONG=$(mpc current)
    DATE=$(date +"%d/%m/%Y")
    HOUR=$(date +"%R")
    MEM=$(free -h  | grep Mem | awk '{ print $NF }')
    CPU=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \
        <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
    WIFI_SIGNAL=$(cat /proc/net/wireless | awk 'NR==3 { print $4 }' | sed 's/\.//')
    SSID=$(iwgetid | cut -d ':' -f2 | sed "s/\"//g")
    VOLUME=$(amixer get Master | awk 'NR==5 { print $4 }' | sed 's/\[//;s/\]//')
    BATT=$(acpi | awk '{ print $4 }' | sed 's/,//g' )

    if [[ $SPOTIFY_SONG =~ "Ad" ]];then
        xsetroot -name " WIFI: $SSID $WIFI_SIGNAL | CPU: $CPU | MEM_FREE: $MEM | VOL: $VOLUME | BATT: $BATT | $DATE | [ $HOUR ] "
        sleep 1
    else 
        xsetroot -name " SPOTIFY: $SPOTIFY_SONG | WIFI: $SSID $WIFI_SIGNAL | CPU: $CPU | MEM_FREE: $MEM | VOL: $VOLUME | BATT: $BATT | $DATE | [ $HOUR ] "
        sleep 1
    fi

done &
exec dwm
