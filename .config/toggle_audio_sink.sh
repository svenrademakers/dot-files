#!/bin/bash

if [[ $(pactl info) =~ Default\ Sink:\ .*\Hyper.* ]]; then
    pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo
else
    pactl set-default-sink alsa_output.usb-Kingston_HyperX_Cloud_II_Wireless_000000000001-00.analog-stereo
fi
