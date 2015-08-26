#!/bin/bash

#some variables
encoder="/usr/local/bin/x264"
prefix="~/Mocha/"
videoname="video.m4v"

#need to refactor this a bit
#echo -n "Enter video path: "
#read vid
echo -n "Enter start frame: "
read sframe
echo -n "Enter total frames: "
read eframe
#declare -i n
n=$eframe-$sframe

#echo $prefix$videoname
#$encoder
#/usr/bin/x264 --crf 16 --tune fastdecode -i 250 --fps 23.976 --sar 1:1 --seek $startf --frames lenf -o $prefix$videoname
$encoder --crf 16 --tune fastdecode -i 250 --fps 23.976 --sar 1:1 --seek $sframe --frames $n -o $prefix$videoname "$*"
ffmpeg -i $prefix$videoname -f image2 $prefix/image%3d.png
