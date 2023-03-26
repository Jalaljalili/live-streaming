#!/bin/bash
set -e
# Usage mp3-hls.sh SOURCE_FILE [OUTPUT_NAME]
#[[ ! "${1}" ]] && echo "Usage: mp3-hls.sh SOURCE_FILE [OUTPUT_NAME]" && exit 1

source="${1}"
target="${2}"
if [[ ! "${target}" ]]; then
  target="${source##*/}" # leave only last component of path
  target="${target%.*}"  # strip extension
fi
mkdir -p ${target}




master_playlist="#EXTM3U
#EXT-X-VERSION:3
#"



# start conversion

ffmpeg -y -i ${source} -c:a aac -b:a 320k -muxdelay 0 -f segment -sc_threshold 0 -segment_time 7 -segment_list "${target}/playlist.m3u8" -segment_format mpegts "${target}/file%d.m4a"

# create master playlist file
#echo -e "${master_playlist}" > ${target}/playlist.m3u8

echo "Done - encoded HLS is at ${target}/"