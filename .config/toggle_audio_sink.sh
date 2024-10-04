#!/bin/bash

set -e

if [[ $(pactl info) =~ Default\ Sink:\ .*\Hyper.* ]]; then
    pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
    notify-send "Audio" "HDMI output selected"
else
    pactl set-default-sink alsa_output.usb-Kingston_HyperX_Cloud_II_Wireless_000000000001-00.analog-stereo
    notify-send "Audio" "Headphones output selected"
fi
