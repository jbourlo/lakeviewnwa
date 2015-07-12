#!/bin/bash

echo "Exchanging $1 for something DVD worthy"
ffmpeg -i "$1" -y -target ntsc-dvd -qscale 0 -aspect 16:9 $1.mpg

