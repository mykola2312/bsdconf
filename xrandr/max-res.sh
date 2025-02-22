#!/usr/bin/env bash

device="$1"

max_res=""
max_area=0

while read res x y; do
  area=$(( $x*$y ))
  if [ $area -ge $max_area ]; then
    max_area=$area
    max_res="$res"
  fi
done< <(./enum-res.sh "$device" | gawk 'match ($1, /([0-9]*)x([0-9]*)/, res) {print $1, res[1], res[2]}')

echo $max_res
