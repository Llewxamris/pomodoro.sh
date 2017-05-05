#!/bin/sh
verbose=false
disphelp=false
silent=false
pomtime=25
brktime=5
pomcount=0
longbrk=3
lngbrkt=10
endtime=0
endcount=0
runpom=true
dingfile='ding.wav'

while getopts 'vhst:b:l:L:k:f:' flag; do
    case "${flag}" in
        v) verbose=true ;;
        t) pomtime=${OPTARG} ;;
        b) brktime=${OPTARG} ;;
        L) longbrk=${OPTARG} ;;
        l) lngbrkt=${OPTARG} ;;
        k) endtime=${OPTARG} ;;
        f) dingfile=${OPTARG} ;;
        h) disphelp=true ;;
        s) silent=true ;;
        *) error "Unknown argument ${flag}"; exit 3 ;;
    esac
done

if $disphelp; then
    echo "pomodoro.sh - Pomodoro productivity shell script.";
    echo "./pomodoro.sh [args]";
    echo "";
    echo "args:";
    echo "[-h]                Displays the help menu."
    echo "[-v]                Enable Verbos mode. Echo the pomodoro stautus to your terminal.";
    echo "                    Off by default."
    echo '[-s]                Silent mode. "Ding" is not played on pomodor, or break.';
    echo "[-t] [minutes]      Set the amount of minutes a pomodoro lasts. Default 25.";
    echo "[-b] [minutes]      Set the amount of minutes a short break lasts. Default 5.";
    echo "[-l] [minutes]      Set the amount of minutes a long break lasts. Default 10.";
    echo "[-L] [number]       Set the amount of pomodoros before triggering a long break";
    echo "                    Default 3.";
    echo "[-k] [number]       Set the amount of pomodoros before ending the script.";
    echo "                    0 means the script will run until stopped by the user. Default 0";
    echo "[-f] [path]         Set the path to the sound file that plays on pomodoro, or break."
    echo "                    Default 'ding.wav'";
    exit 0;
fi

while $runpom; do
    if $verbose; then
        echo "Pomodoro! Pomodoro will last for $pomtime minute(s).";
    fi
    notify-send "Pomodoro! Pomodoro will last for $pomtime minute(s).";
    if [ "$silent" = false ]; then
        aplay -q "$dingfile";
    fi
    sleep $((pomtime * 60));
    pomcount=$((pomcount + 1))
    if [ $pomcount -eq "$longbrk" ]; then
        pomcount=0;
        if $verbose; then
            echo "Long Break! Break will last for $lngbrkt minute(s).";
        fi
        notify-send "Long Break! Break  will last for $lngbrkt minute(s).";
        sleep $((lngbrkt * 60));
    else
        if $verbose; then
            echo "Short Break! Break will last for $brktime minute(s).";
        fi
        notify-send "Short Break! Break  will last for $brktime minute(s).";
        sleep $((brktime * 60));
    fi
    endcount=$((endcount + 1))
    if [ "$endtime" -gt 0 ] && [ "$endtime" -eq $endcount ]; then
        runpom=false;
    fi
done
