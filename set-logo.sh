#!/bin/bash

# Input URL and logo file
input_url="INPUT_URL"
logo_file="LOGO_FILE.png"

# Logo position (top right corner)
logo_pos="main_w-overlay_w-10:10"

# HLS bitrates to encode to
bitrates=(1000k 500k 250k 100k)

# Create output directory if it does not exist
output_dir="output"
mkdir -p "$output_dir"

# Encode input URL to HLS for each bitrate
for bitrate in "${bitrates[@]}"
do
    # Set output file name
    output_file="$output_dir/output_${bitrate}.m3u8"
    
    # Run FFmpeg command to encode input URL to HLS
    ffmpeg -i "$input_url" \
           -i "$logo_file" \
           -filter_complex "overlay=$logo_pos" \
           -c:a aac \
           -c:v h264 \
           -hls_flags delete_segments \
           -hls_time 10 \
           -hls_list_size 6 \
           -b:v "$bitrate" \
           "$output_file"
done
