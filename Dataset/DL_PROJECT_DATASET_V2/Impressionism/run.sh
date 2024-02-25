#!/bin/zsh

# Check if the script2.txt file exists
if [ ! -f script2.txt ]; then
  echo "Error: script2.txt does not exist in the current directory."
  exit 1
fi

# Initialize an array to keep track of used numbers
used_numbers=()

# Loop through the lines in script2.txt
while IFS= read -r image_url; do
  # Generate a random number between 1 and 10000
  random_number=$((1 + RANDOM % 10000))

  # Check if the random number has been used before
  while [[ "${used_numbers[@]}" =~ "${random_number}" ]]; do
    random_number=$((1 + RANDOM % 10000))
  done

  # Add the random number to the used_numbers array
  used_numbers+=($random_number)

  # Use curl to download the image and name it with the random number
  curl -o "${random_number}.jpg" "$image_url"
done < script2.txt

echo "Downloaded ${#used_numbers[@]} images."
