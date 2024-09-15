#!/usr/bin/env bash

device="$1"
output=$(xrandr)

begin=$(echo "$output" | awk '$1=="'$device'" { print NR }')
end=$(echo "$output" | awk 'NR>'$begin' { if ($1 ~ /\d*x\d*/) {} else { print NR; exit } }')

echo "$output" | awk "NR > $begin && NR < $end"
