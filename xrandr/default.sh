#!/usr/bin/env bash
source config.sh

xrandr --output VGA-1 --off
xrandr --output HDMI-1 --off
xrandr --output DP-1 --off

xrandr --output $primary --mode $defalt_res