#!/bin/bash

ffmpeg -i somefile.mp3 -f segment -segment_time 3 -c copy out%03d.mp3

