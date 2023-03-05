#!/bin/bash

# Split into an array: ARR+=("$(ls -d */)")
#lsVar=("$(ls "$1" -d)")

#mapfile -t contents < <(ls -d -- *)

#shopt -s nullglob
#lsVar=("$1")
#shopt -u nullglob

# https://stackoverflow.com/questions/66209771/how-can-i-iterate-over-some-file-names-returned-from-ls-command
audioFiles=("$1/audio/"*)
COUNTER=0
#mapfile -t lsVar < <(ls -d -- *)
#for file in "${audioFiles[@]}"; do
for i in "${audioFiles[@]}"; do
    echo "$i"
    echo "$COUNTER"
    mkdir "$1/transcripts/$COUNTER"
    whisper "$i" --language Spanish -o "$1/transcripts/$COUNTER"
    mv "$i" "$1/completed"
    COUNTER=$(( COUNTER + 1))
  done