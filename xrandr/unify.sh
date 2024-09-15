#!/usr/bin/env bash
source config.sh

secondary=$(./vga-or-hdmi.sh)
if [ -z "$secondary" ]; then
    >&2 echo "no VGA or HDMI output is present!"
fi

same_res=$(./same-res.sh "$primary" "$secondary")
if [ $? -ne 0 ]; then
    >&2 echo "equal resolution for $primary and $secondary was not found"
    exit 1
fi

xrandr --output $primary --mode $same_res --primary --output $secondary --mode $same_res --same-as $primary
