#!/bin/bash
xiname="Touchscreen"
if [ "$#" -eq 1 ]; then
    xiname=$1 #to avoid possible error due to touchscreen.state mismatch, program may have to be run repeatedly, upto 3 times - unmitigated issue
fi
tsiid=$(xinput | grep -i $xiname | awk -F'id=' '{print $2}' | sed -r 's|^([^.]+).*$|\1|; s|^[^0-9]*([0-9]+).*$|\1|')
CS=$(xinput --list-props $tsiid|grep 'Device Enabled'|awk -F ':\t' '{print $NF}')
if [ "$CS" = "0" ]; then
    xinput enable $tsiid
    #echo "Touch screen is now enabled"
    echo "ON" > ~/.toggletouch/touchscreen.state
fi
if [ "$CS" = "1" ]; then #could use else instead too, but this is more specific (secure?)
    xinput disable $tsiid
    #echo "Touch screen is now disabled"
    echo "OFF" > ~/.toggletouch/touchscreen.state
fi
