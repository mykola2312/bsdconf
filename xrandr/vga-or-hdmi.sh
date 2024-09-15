#!/usr/bin/env bash

output=$(xrandr | awk '$2=="connected" { if ($1 ~ /VGA|HDMI/) { print $1 } }')
if [ -z "$output" ]; then
  exit 1;
else
  echo $output
fi
