#!/bin/bash

# Function to run FFmpeg in the background
run_ffmpeg() {
    ffmpeg -hide_banner -y -i {SOURCE} -c:v copy -c:a copy -f null /dev/null
}

# Loop to run the FFmpeg command 10 times in parallel
for ((i=1; i<=10; i++)); do
    run_ffmpeg &
done
