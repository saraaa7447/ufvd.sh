#!/bin/bash

# Print information
echo "Universal Free Video Downloader 1.0"
echo "By ScarlettPPC 2024"


echo "Enter link to YouTube video or playlist: "
read _link

echo "Download as (V)ideo or (A)udio?"
read _output


if [ $_output == "v" ]; then
	echo "Choose quality:"
	echo "1. Best, 2. 1080p, 3. 720p, 4. 480p, 5. 360p, 6. 240p, 7. 144p"
	echo "Type the desired quality as either best or the resolution in numbers"
	read _quality 

	if [ $_quality == "best" ]; then
	echo "Downloading in best quality..."
	yt-dlp_macos -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "$_link" --embed-thumbnail
	else
	yt-dlp_macos -f "best[height<=$_quality]" "$_link" --embed-thumbnail
	fi
fi

if [ $_output == "a" ]; then
	echo "Choose output file type (mp3, opus, m4a):"
	read _file

        if [ $_file == "mp3" ]; then
        yt-dlp_macos -x --audio-format mp3 "$_link" --embed-thumbnail --add-metadata
        elif [ $_file == "opus" ]; then
	yt-dlp_macos -x -f bestaudio "$_link"
	else
	yt-dlp_macos -x --audio-format m4a "$_link" --embed-thumbnail --add-metadata
	fi
fi

