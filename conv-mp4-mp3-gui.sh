#!/bin/sh

# Prompt the user for the source file
source_file=$(zenity --file-selection --title="Select the source MP4 file")

# Prompt the user for the destination file
destination_file=$(zenity --file-selection --save --title="Select the destination MP3 file")

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  zenity --error --text="FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Convert MP4 to MP3
ffmpeg -i "$source_file" -vn -acodec libmp3lame "$destination_file"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
  zenity --info --text="Conversion successful! The MP3 file is saved as $destination_file"
else
  zenity --error --text="Conversion failed!"
fi