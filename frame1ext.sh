#!/bin/sh

# Prompt the user for the source video file
echo "Enter the source video file path:"
read source_file

# Prompt the user for the destination PNG file path
echo "Enter the destination PNG file path:"
read destination_file

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Extract the first frame as a PNG
ffmpeg -i "$source_file" -vf "select=eq(n\,0)" -vsync vfr "$destination_file"

# Check if the extraction was successful
if [ $? -eq 0 ]; then
  echo "Extraction successful! The first frame is saved as $destination_file"
else
  echo "Extraction failed!"
fi

