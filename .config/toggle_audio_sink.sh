#!/bin/bash

set -e

hdmi_output="alsa_output.pci-0000_01_00.1.hdmi-stereo"
headphones="alsa_output.usb-Kingston_HyperX_Cloud_II_Wireless_000000000001-00.analog-stereo"

if [[ $(pactl info) =~ "Default Sink: ${headphones}" ]]; then
    pactl set-default-sink ${hdmi_output}
    notify-send "Audio" "HDMI output selected"
else
    echo "kan niet"
    pactl set-default-sink ${headphones}
    notify-send "Audio" "Headphones output selected"
fi
