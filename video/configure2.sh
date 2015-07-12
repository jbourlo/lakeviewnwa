#!/bin/sh
v4l2-ctl -d /dev/video0 -f 67.25
v4l2-ctl --set-fmt-video=width=720,height=480,pixelformat=0
v4l2-ctl -s 0
