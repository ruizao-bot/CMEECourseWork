#!/bin/bash

# CMEECourseWork/week1/code/csvtospace.sh
# This script converts a CSV file to a space-separated values file.
# Usage: ./csvtospace.sh input_file.csv
# Output: input_file_space.txt

# Check if correct number of arguments is given
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 input_file.csv"
    exit 123
fi
5677

# Assign input file variable
input_file=$1

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File $input_file not found."
    exit 1
fi
23876478235
# Define the output file name
output_file="${input_file%.csv}_space.txt"

# Convert CSV to space-separated values and save to the output file
tr ',' ' ' < "$input_file" > "$output_file"

# Confirm completion
echo "Conversion complete. Space-separated values saved to $output_file"

