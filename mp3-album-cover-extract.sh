#!/bin/sh

# Prompt the user for the source MP3 file
echo "Enter the source MP3 file path:"
read mp3_file

# Prompt the user for the destination PNG file path
echo "Enter the destination PNG file path:"
read png_file

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Extract album cover image from MP3 and save as PNG
ffmpeg -i "$mp3_file" -an -vcodec copy "$png_file"

# Check if the extraction was successful
if [ $? -eq 0 ]; then
  echo "Album cover extracted successfully! The image is saved as $png_file"
else
  echo "Extraction failed!"
fi
