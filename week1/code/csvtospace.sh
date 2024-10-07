#!/bin/sh
# Author: Jiayi Chen jc224@imperial.ac.uk
# Script: csvtospace.sh
# Description: converts a comma separated values file to a space separated values file
# Saves the output into a .csv file
# Arguments: 1 -> comma delimited file
# Date: Oct 2024

# Check if correct number of arguments is given
if [ "$#" -ne 1 ]; then
    echo "Error: $0 need input_file.csv"
    exit 1
fi

# Check if input file exists
if [ ! -f "$1" ]; then
    echo "Error: File $1 not found."
    exit 1
fi


# Define the output file name
output_file="${1%.csv}_space.txt"

# Convert CSV to space-separated values and save to the output file
tr ',' ' ' < "$1" > "$output_file"

# Confirm completion
echo "Conversion complete. Space-separated values saved to $output_file"
exit 0

