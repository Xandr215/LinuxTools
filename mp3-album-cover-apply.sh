#!/bin/sh

# Prompt the user for the audio file (MP3)
echo "Enter the source audio file path (MP3):"
read audio_file

# Prompt the user for the image file (album cover)
echo "Enter the album cover image file path (JPEG or PNG):"
read image_file

# Prompt the user for the output file path
echo "Enter the output audio file path (with album cover):"
read output_file

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Apply album cover to audio file
ffmpeg -i "$audio_file" -i "$image_file" -map 0:0 -map 1:0 -c copy -id3v2_version 3 "$output_file"

# Check if the operation was successful
if [ $? -eq 0 ]; then
  echo "Album cover applied successfully! The output file is saved as $output_file"
else
  echo "Failed to apply album cover."
fi
