#!/bin/sh
# Author: Jiayi Chen jc224@imperial.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2024

# check if there is an input file
if [ -z "$1" ]; then
  echo "Error: No input file provided."
  echo "Usage: bash script.sh <tab-delimited-file>"
  exit 1
fi

# check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

# Check the file extension to prevent overwriting the original CSV file
if [[ "$1" == *.csv ]]; then
  echo "Error: The input file is already a CSV file."
  exit 1
fi

# Define the target directory for output
target_dir="../results"

# Extract the base name of the input file (removes the directory part)
base_name=$(basename "$1" .txt)

# Define the output file name (place it inside the target directory)
output_file="${target_dir}/${base_name}_comma.csv"

# Replace tabs with commas and write the result to a new CSV file.
sed 's/[[:space:]]\+/,/g' "$1" > "$output_file"

# Confirm completion
echo "Conversion complete. The file has been converted to '$output_file'."

exit

