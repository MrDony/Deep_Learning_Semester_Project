#!/bin/zsh

# Check if the script2.txt file exists
if [ ! -f script2.txt ]; then
  echo "Error: script2.txt does not exist in the current directory."
  exit 1
fi

# Initialize a counter for naming the images
counter=1

# Loop through the lines in script2.txt
while IFS= read -r image_url; do
  # Use curl to download the image and name it sequentially
  curl -o "${counter}.jpg" "$image_url"
  
  # Increment the counter for the next image
  ((counter++))
done < script2.txt

echo "Downloaded $((counter-1)) images."
