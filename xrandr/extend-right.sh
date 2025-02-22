#!/usr/bin/env bash

source config.sh
secondary=$(./vga-or-hdmi.sh)
if [ $? -ne 0 ]; then
    >&2 echo "no VGA or HDMI output is present!"
    exit 1
fi

secondary_res=$(./max-res.sh "$secondary")
if [ -z "$secondary_res" ]; then
    >&2 echo "max res for secondary $secondary not found!"
    exit 1
fi

xrandr --output $primary --output $secondary --mode $secondary_res --right-of $primary
