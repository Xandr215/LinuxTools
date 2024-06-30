#!/bin/sh

# Prompt the user for the source file
echo "Enter the source MP4 file path:"
read source_file

# Prompt the user for the destination file
echo "Enter the destination MP3 file path:"
read destination_file

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Convert MP4 to MP3
ffmpeg -i "$source_file" -vn -acodec libmp3lame "$destination_file"

# Check if the conversion was successful
if [ $? -eq 0 ]; then
  echo "Conversion successful! The MP3 file is saved as $destination_file"
else
  echo "Conversion failed!"
fi
