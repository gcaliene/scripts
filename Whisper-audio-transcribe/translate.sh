#!/bin/bash

# Split into an array: ARR+=("$(ls -d */)")
#lsVar=("$(ls "$1" -d)")

#mapfile -t contents < <(ls -d -- *)

#shopt -s nullglob
#lsVar=("$1")
#shopt -u nullglob

# https://stackoverflow.com/questions/66209771/how-can-i-iterate-over-some-file-names-returned-from-ls-command
audioFiles=("$1/audio/"*)
COUNTER=1
#mapfile -t lsVar < <(ls -d -- *)
#for file in "${audioFiles[@]}"; do
for i in "${audioFiles[@]}"; do
  echo "$1"
    mkdir "$1/transcripts/$COUNTER"
    whisper "$i" --language Spanish -o "$1/transcripts/$COUNTER" --task translate --device cuda
#    whisper "$i" --language Spanish --task translate --device cuda

    mv "$i" "$1/completed"
    COUNTER=$(( COUNTER + 1))
done

# Split audio every 5 minutes with ffmpeg and save to a folder
 ffmpeg -i somefile.mp3 -f segment -segment_time 300 -c copy out%03d.mp3