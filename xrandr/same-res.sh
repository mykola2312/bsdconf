#!/usr/bin/env bash

device1="$1"
device2="$2"

while read res1 x1 y1; do
  area1=$(( $x1*$y1 ))
    while read res2 x2 y2; do
    area2=$(( $x2*$y2 ))
        if [ $area1 -eq $area2 ]; then
            echo $res2
            exit
        fi
    done< <(./enum-res.sh "$device2" | gawk 'match ($1, /([0-9]*)x([0-9]*)/, res) {print $1, res[1], res[2]}')
done< <(./enum-res.sh "$device1" | gawk 'match ($1, /([0-9]*)x([0-9]*)/, res) {print $1, res[1], res[2]}')

exit 1