"""
This script demonstrates how to read a file line by line.

It includes two examples:
1. Reading and printing each line from a file.
2. Reading and printing each line from the file while skipping blank lines.

"""
#############
# FILE INPUT
#############
# Open a file for reading
with open('../sandbox/test.txt', 'r') as f:
# use "implicit" for loop;
# if the object is a file, python will cycle over lines
    for line in f:
        print(line)

# Once you drop out of the with, the file is automatically closed

#Same example, skip blank lines
with open('../sandbox/test.txt', 'r') as f:
    for line in f:
        if len(line.strip()) > 0:
            print(line)
