#!/bin/sh
# Author: Jiayi Chen jc224@imperial.ac.uk
# Script: csvtospace.sh
# Description: converts a comma separated values file to a space separated values file
# Saves the output into a .csv file
# Arguments: 1 -> comma delimited file
# Date: Oct 2024

# Set the working directory
cd ../data || { echo "Error: Could not change directory to ../data"; exit 1; }

# Check if there are any .tif files in the directory
tif_files=(*.tif)
if [ ${#tif_files[@]} -eq 0 ]; then
  echo "No .tif files found in the current directory."
  exit 1
fi

# Define the target directory for output
target_dir="../results"

# Convert the tif file to png and save it in the ../results directory
 for f in "${tif_files[@]}"; do
 # Extract the base name without extension
 base_name=$(basename "$f" .tif)

 # Define the output file path inside the ../results directory
 output_file="${target_dir}/${base_name}.png"
 
  if convert "$f" "$output_file"; then
    echo "Successfully converted $f to $output_file"
  else
    echo "Failed to convert $f"
  fi
done

