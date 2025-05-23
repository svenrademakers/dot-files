#/bin/bash

export PATH=/usr/bin
export DISPLAY=:0
external_display_status=`cat /sys/class/drm/card0-eDP-1/status || echo "disconnected"`

send_notification()
{
    notify-send Display "External monitor $external_display_status"
}

connect ()
{
   xrandr --output DP-4 --off
   xrandr --output DP-0 --auto --primary
   #xrandr --setprovideroutputsource modesetting NVIDIA-0
   nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
}

disconnect ()
{
   xrandr --output DP-4 --auto
}

connect || disconnect
send_notification
