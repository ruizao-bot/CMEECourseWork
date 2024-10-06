#!/bin/bash

# Author: Jiayi Chen jc224@imperial.ac.uk
# Script: ConcatenateTwoFiles.sh
# Description: Concentrate the content of  two existing files into one other file
# Date: Oct 2024

# check the presence of three files
if [ "$#" -ne 3 ]; then
  echo "Error: Three arguments required: <file1> <file2> <outputfile>"
  echo "Usage: bash script.sh <file1> <file2> <outputfile>"
  exit 1
fi

# check if the first file exist
if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

# check if the second file exist
if [ ! -f "$2" ]; then
  echo "Error: File '$2' not found."
  exit 1
fi

# put the content of file 1 into file 3
cat "$1" > "$3"

# add the content of file 2 into file 3
cat "$2" >> "$3"

# remind merge completed
echo "Files '$1' and '$2' have been merged into '$3'."

