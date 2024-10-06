#!/bin/bash

# Author: Jiayi Chen jc224@imperial.ac.uk
# Script: CountLines.sh
# Description: Count the amount of lines in one file
# Date: Oct 2024

# Check if an input file is provided
if [ -z "$1" ]; then
  echo "Error: No input file provided."
  echo "Usage: bash script.sh <input-file>"
  exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

# Check if more than one input file is provided
if [ "$#" -gt 1 ]; then
  echo "Error: Only the first file will be processed."
  echo "Usage: bash script.sh <input-file>"
  exit 1
fi

# Count lines and export the number
NumLines=`wc -l < $1`
echo "The file $1 has $NumLines lines"
echo
