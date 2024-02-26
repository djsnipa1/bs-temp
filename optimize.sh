#!/usr/bin/env bash


# ffmpeg -i beatstar_peru.mp4 -c:v libvpx-vp9 -crf  40 -vf scale=3840:-2 -deadline best -an beatstar_peru.webm

ffmpeg -i beatstar_peru.mp4 -c:v libx265 -crf  32 -vf scale=3840:-2 -preset veryslow -tag:v hvc1 -movflags faststart -an beatstar_peru-265.mp4
