#!/usr/bin/env bash

URL="https://youtube.com/watch?v=9B1SQX9a_hU"
FILENAME="beatstar2"
EXT=".mp4"

#yt-dlp $URL -o "%(title)s.%(ext)s" -f bestvideo[ext=mp4]
yt-dlp $URL -o "${FILENAME}${EXT}" -f bestvideo[ext=mp4]
echo "Download $FILENAME complete!"

ffmpeg -i "${FILENAME}${EXT}" -c:v libx265 -crf  26 -preset fast -c:a aac -b:a  128k "${FILENAME}-opt${EXT}"
echo "Optimize $FILENAME complete!"
