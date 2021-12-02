#!/bin/bash 

echo OctoPrint Webcam Stream: $1
echo Live-stream secret: $2
echo Filter: $3
echo Framerate: $4

ffmpeg -re -f mjpeg -framerate $4 -i $1 -ar 44100 -ac 2 -acodec pcm_s16le -f s16le -ac 2 -i /dev/zero -acodec aac -ab 128k -strict experimental -vcodec h264 -pix_fmt yuv420p -g 10 -vb 700k -framerate $4 -f flv -filter:v $3 rtmp://a.rtmp.youtube.com/live2/$2
