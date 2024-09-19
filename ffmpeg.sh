#!/usr/bin/env bash
input="$1"
output="$2"

vaapi_device="/dev/dri/renderD128"
vaapi_codec="h264_vaapi"

ffmpeg                                    \
  -init_hw_device vaapi=foo:$vaapi_device \
  -hwaccel vaapi                          \
  -hwaccel_output_format vaapi            \
  -hwaccel_device foo                     \
  -i "$input"                             \
  -filter_hw_device foo                   \
  -vf 'format=nv12|vaapi,hwupload'        \
  -threads 4                              \
  -c:v "$vaapi_codec"                     \
  -c:a aac                                \
  "$output"
