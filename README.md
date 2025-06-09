# chapter-to-file
You need a linux distribution to run this. Tested on Manjaro Linux x86_64. I also considered the name youtube playlist splitter, because it turns those wonderful video game music videos into individual files. Also, I put this in there so that you'd find it.
## How to execute:
Disclaimer: I'm a good guy, but you shouldn't just blindly run any script on the internet. Maybe take a read first. Make sure it doesn't rm -rf / your directory. Or does a cypher to descrypt obscured code. And so on.
```
chmod +x script.sh
./script.sh Type in your first character and press tab, and it'll do that work on the file.
```
## Further description.
You've probably looked on stack: audio - How do I split an MP3 file without re-encoding it？ - Super User (2025-05-31 10：07：08 p.m.)
You've also maybe looked at:
```
Is there an elegant way to split a file by chapter using ffmpeg？ - Stack Overflow (2025-05-31 10：11：55 p.m.)
linux - Difference between ${} and $() in Bash - Stack Overflow (2025-06-09 10：54：58 a.m.)
bash - How to add leading zeros for for-loop in shell？ - Stack Overflow (2025-06-09 12：25：24 p.m.)
Strip metadata from all formats with FFmpeg - Super User (2025-06-09 12：39：01 p.m.)
How to remove ID3 audio tag image (or metadata) from mp3 with ffmpeg - Stack Overflow (2025-06-09 12：39：06 p.m.)
```
###The history of it, is interesting. To me. I'll keep it simple.
- -map_metadata -1 \
This fixes the issue of that: when you press a song in vlc for android, it'll change back to the meta title, not the chapter title.
- sed "s|/|,|"
This fixes the command from not running. turns out having those things will prevent it from running. Those characters will be sacked, and turned into nothing (monthy python reference).
- (( number+=1 ))
The counter is there so you keep the original composition of the playlist.
- "$(printf "%03d\n" $number)-$chapter.${input##*.}" 
That's too much, let's try again.
- $(printf "%03d\n" $number)
ah, much better. So we are running a subshell to format our counter.
```
And the rest, I'll leave to you.
Alright, goodbye, hope you like it.
```
