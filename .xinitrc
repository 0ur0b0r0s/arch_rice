#!/bin/bash

sxhkd &
picom &
numlockx on &
xset r rate 300 50
xset -dpms
xset s off
dash ~/.scripts/keyboardDetection.sh &
xrandr --output eDP-1-1 --mode 1366x768 --pos 1920x312 --rotate normal --output HDMI-1-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal
xrandr --output eDP-1-1 --off --output HDMI-1-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal
sleep 0.1s && feh --bg-fill ~/.config/wall.png &
while true; do
    SPOTIFY_SONG=$(spotify-now -i "%artist - %title")
    SONG=$(mpc current)
    DATE=$(date +"%d/%m/%Y")
    HOUR=$(date +"%R")
    MEM=$(free -h  | grep Mem | awk '{ print $NF }')
    CPU=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1) "%"; }' \
        <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
    GPU_TEMP=$(nvidia-settings -q gpucoretemp -t | head -n1)
    GPU_FREE=$(nvidia-smi -a | awk '/Free/ { print $3 }' | head -n1)
    WIFI_SIGNAL=$(cat /proc/net/wireless | awk 'NR==3 { print $4 }' | sed 's/\.//')
    SSID=$(iwgetid | cut -d ':' -f2 | sed "s/\"//g")
    VOLUME=$(amixer get Master | awk 'NR==5 { print $4 }' | sed 's/\[//;s/\]//')

    if [[ $SPOTIFY_SONG =~ "Ad" ]];then
        xsetroot -name " WIFI: $SSID $WIFI_SIGNAL | CPU: $CPU | GPU_TEMP: $GPU_TEMP C | GPU_FREE: $GPU_FREE Gb | MEM_FREE: $MEM | VOL: $VOLUME | $DATE | [ $HOUR ] "
    else 
        xsetroot -name " SPOTIFY: $SPOTIFY_SONG | WIFI: $SSID $WIFI_SIGNAL | CPU: $CPU | GPU_TEMP: $GPU_TEMP C | GPU_FREE: $GPU_FREE Gb | MEM_FREE: $MEM | VOL: $VOLUME | $DATE | [ $HOUR ] "
    fi

    #if [ -z "$SONG" ];then
    #    xsetroot -name " SONG: $SPOTIFY_SONG | WIFI: $SSID $WIFI_SIGNAL | CPU: $CPU | GPU_TEMP: $GPU_TEMP C | GPU_FREE: $GPU_FREE Gb | MEM_FREE: $MEM | VOL: $VOLUME | $DATE | [ $HOUR ] "
    #else
    #    xsetroot -name " SONG: $SPOTIFY_SONG | WIFI: $SSID $WIFI_SIGNAL | CPU: $CPU | GPU_TEMP: $GPU_TEMP C | GPU_FREE: $GPU_FREE Gb | MEM_FREE: $MEM | VOL: $VOLUME | $DATE | [ $HOUR ] "
    #fi

done &
exec dwm
