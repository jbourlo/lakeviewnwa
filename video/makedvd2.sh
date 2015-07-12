#!/bin/bash

echo "Exchanging $1 for something DVD worthy"
ffmpeg -i "$1" -y -target ntsc-dvd -qscale 0 dvd/video.mpg

export VIDEO_FORMAT=NTSC

echo > dvd.xml <<EOF
#autogen
<dvdauthor>
    <vmgm />
    <titleset>
        <titles>
            <pgc>
                <vob file="02222015m.mp4.mpg" />
            </pgc>
        </titles>
    </titleset>
</dvdauthor>
EOF

echo "DVD author dispatch"
dvdauthor -o dvd -x dvd.xml

echo "Test it with mplayer"
mplayer dvd:// -dvd-device ./dvd
growisofs -dvd-compat -Z /dev/hdc -dvd-video ./dvd/
