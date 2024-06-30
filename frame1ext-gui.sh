#!/bin/sh

# Prompt the user for the source video file
source_file=$(zenity --file-selection --title="Select the source video file")

# Prompt the user for the destination PNG file
destination_file=$(zenity --file-selection --save --title="Select the destination PNG file")

# Check if FFmpeg is installed
if ! command -v ffmpeg >/dev/null 2>&1; then
  zenity --error --text="FFmpeg is not installed. Please install it and try again."
  exit 1
fi

# Extract the first frame as a PNG
ffmpeg -i "$source_file" -vf "select=eq(n\,0)" -vsync vfr "$destination_file"

# Check if the extraction was successful
if [ $? -eq 0 ]; then
  zenity --info --text="Extraction successful! The first frame is saved as $destination_file"
else
  zenity --error --text="Extraction failed!"
fi
