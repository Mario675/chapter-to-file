#!/bin/sh -efu

input="$1"
number=0
ffprobe \
    -print_format csv \
    -show_chapters \
    "$input" |
cut -d ',' -f '5,7,8' |  sed "s|/|,|" |
while IFS=, read start end chapter
do
    (( number+=1 ))
    
    ffmpeg \
        -nostdin \
        -ss "$start" -to "$end" \
        -i "$input" \
        -c copy \
        -map 0 \
        -map_chapters -1 \
        -map_metadata -1 \
    "$(printf "%03d\n" $number)-$chapter.${input##*.}"          
done
