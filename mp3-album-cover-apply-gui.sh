#!/bin/sh

# Prompt the user for the audio file (MP3)
audio_file=$(zenity --file-selection --title="Select the source audio file (MP3)")

# Prompt the user for the image file (album cover)
image_file=$(zenity --file-selection --title="Select the album cover image file (JPEG or PNG)")

# Prompt the user for the output file path
output_file=$(zenity --file-selection --save --title="Select the output audio file path (with album cover)")

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  zenity --error --text="FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Apply album cover to audio file
ffmpeg -i "$audio_file" -i "$image_file" -map 0:0 -map 1:0 -c copy -id3v2_version 3 "$output_file"

# Check if the operation was successful
if [ $? -eq 0 ]; then
  zenity --info --text="Album cover applied successfully! The output file is saved as $output_file"
else
  zenity --error --text="Failed to apply album cover."
fi