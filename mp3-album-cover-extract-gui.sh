#!/bin/sh

# Prompt the user for the source MP3 file
mp3_file=$(zenity --file-selection --title="Select the source MP3 file")

# Prompt the user for the destination PNG file
png_file=$(zenity --file-selection --save --title="Select the destination PNG file")

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  zenity --error --text="FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Extract album cover image from MP3 and save as PNG
ffmpeg -i "$mp3_file" -an -vcodec copy "$png_file"

# Check if the extraction was successful
if [ $? -eq 0 ]; then
  zenity --info --text="Album cover extracted successfully! The image is saved as $png_file"
else
  zenity --error --text="Extraction failed!"
fi