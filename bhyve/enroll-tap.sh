#!/usr/bin/env bash

bridge=$1
tap=$2

while true; do
  ifconfig $tap
  if [ $? -eq 0 ]; then
    ifconfig $bridge addm $tap
    break
  fi

  sleep 1
done
