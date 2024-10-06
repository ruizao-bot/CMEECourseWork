#!/bin/sh
# Author: Jiayi Chen jc224@imperial.ac.uk
# Script: csvtospace.sh
# Description: converts a comma separated values file to a space separated values file
# Saves the output into a .csv file
# Arguments: 1 -> comma delimited file
# Date: Oct 2024

# Check if there are any .tif files in the directory
tif_files=(*.tif)
if [ ${#tif_files[@]} -eq 0 ]; then
  echo "No .tif files found in the current directory."
  exit 1
fi

# If the file is a *.tif, convert it to a png file.
for f in *.tif; 
    do  
        echo "Converting $f"; 
        convert "$f"  "$(basename "$f".tif).png"; 
        echo "successful convert"
    done

