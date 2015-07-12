#!/bin/bash
# camera details
#	system RGB 3-CCD system
#	picture elements: 410,000 pixel
#	10 bit a/d quantization @ 14.3mhz
#	shutter speeds: 1/100, 1/120, 1/250, 1/500, 1/1000, 1/2000
#	res 720x400
#	cam. out 1v peaktopeak 75ohm`
# frame rate for NTSC 29.97, fields are interlaced

#ffmpeg -f alsa -i hw:1 -f v4l2 -async 32000 -s 720x480 -r 30000/1001 -i /dev/video0 out.avi;
#ffmpeg  -f alsa -i hw:1 -f v4l2 -pix_fmt 0rgb -q 1 -async 32000 -s 720x480  -i /dev/video0 out.avi;
#ffmpeg   -f alsa -i hw:0 -f v4l2  -s 720x480 -async 32000  -i /dev/video0 -vcodec mpeg4 -s 720x480 -r 30000/1001  out.mp4;
#ffmpeg  -y -v verbose -f alsa -i hw:0 -f v4l2  -i /dev/video0 -aq:0 0 -ar:0 44100 -vsync drop -channel 1 -c:a libmp3lame -c:v h264 -movflags +faststart -b:v 6000k    out.mp4;
#ffmpeg  -y -v verbose -f alsa -i hw:0 -f v4l2  -i /dev/video0 -aq:0 0 -ar:0 44100 -vsync drop \
#	-c:a libmp3lame \
#	-c:v h264  -preset fast -qp 1  out.mp4;
#ffmpeg  -y -f alsa -i hw:1,0 -aq:0 0 -ar:0 8000 -ac:0 1 -c:a libmp3lame -q:a 2    out.mp3;

#ffmpeg   -f alsa -i hw:2,0 -f v4l2  -pix_fmt 0rgb -s 720x480 -async 100000 -i /dev/video0 -vcodec mpeg4 -r 29.97 -q 1 -s 720x480  out.mov;
#ffplay -f alsa -i hw:1 -f v4l2  -r 29.97 -i /dev/video0 out.avi;

#	-async 32000 \

	#-c:v mpeg4 \
	#-f alsa -i hw:2,0  -f v4l2  -i /dev/video0 \

ffmpeg  \
	-y -v verbose \
	-f v4l2 -i /dev/video0 \
	-f alsa -i hw:2,0 \
	-framerate 30 -r 30 -video_size 720x480 \
	-c:a libvorbis \
	-c:v libvpx -crf 63 -profile 0 -deadline good  \
	-framerate 30 \
	out.webm
	# this causes a kernel panic -f:1 rawvideo pipe:1 | ffplay -i pipe:0  -f rawvideo -pix_fmt yuv420p  -video_size 720x480 -framerate 29.97
	#-c:a libmp3lame -q:a 2 \


